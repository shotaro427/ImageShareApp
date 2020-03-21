import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_share_app/widgets/commont_widgets/common_loading_widget.dart';
import 'package:image_share_app/widgets/room_list/create_room_page.dart';
import 'package:image_share_app/models/room_list_model/room_list_model.dart';
import 'package:image_share_app/repositories/room_list_repository/joined_room_list_repository.dart';
import 'package:image_share_app/widgets/sing_in/sign_in_page.dart';
import 'package:provider/provider.dart';
import 'package:image_share_app/widgets/top_image_list/top_image_list.dart';

class RoomListPage extends StatelessWidget {
  final RoomListRepository _repository;

  RoomListPage(this._repository);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Provider<RoomListBloc>(
      create: (context) => RoomListBloc(_repository),
      dispose: (_, bloc) => bloc.dispose(),
      child: Stack(
        children: <Widget>[
          DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                title: const Text("ルーム一覧"),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.exit_to_app),
                    tooltip: 'ログアウト',
                    onPressed: () async => await _showLogoutDialog(context),
                  )
                ],
                bottom: const TabBar(
                  tabs: <Widget>[
                    Tab(text: '参加グループ',),
                    Tab(text: '招待グループ',)
                  ],
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  _RoomListWidget(),
                  _WaitingRoomListWidget()
                ],
              ),
              floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.add),
                tooltip: "ルームを追加",
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CreateRoomPage(_repository))),
              ),
            ),
          ),
          CommonLoadingWidget<RoomListBloc>(isShowDialog: false,)
        ],
      ),
    );
  }

  /// ログアウトダイアログを表示
  void _showLogoutDialog(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('ログアウト'),
            content: const Text('ログアウトしますか？'),
            actions: <Widget>[
              FlatButton(
                  child: const Text('いいえ'),
                  onPressed:  () => Navigator.of(context).pop()
              ),
              FlatButton(
                child: const Text('はい'),
                onPressed: () async {
                  await _logout();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (BuildContext context) => SignInPage()),
                          (_) => false
                  );
                },
              )
            ],
          );
        }
    );
  }

  /// ログアウトする
  void _logout() async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    await _firebaseAuth.signOut();
  }
}

/// すでに参加しているルーム一覧
class _RoomListWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _RoomListWidgetState();
}

class _RoomListWidgetState extends State<_RoomListWidget> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var bloc = Provider.of<RoomListBloc>(context, listen: false);
    bloc.fetchRooms();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    // TODO: implement build
    return _RoomListContainerWidget();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class _RoomListContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<RoomListBloc>(context, listen: false);
    return StreamBuilder<List<DocumentSnapshot>>(
      stream: bloc.roomListStream,
      builder: (context, snapshot) {
        // データを持っていたらリストを表示させる
        if(snapshot.hasData) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black38),
                  ),
                ),
                child: ListTile(
                  leading: const Icon(Icons.home),
                  title: Text(
                    snapshot.data[index]["name"].toString(),
                    style: const TextStyle(fontSize: 20),),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TopImagesPage(snapshot.data[index]);
                  })),
                ),
              );
            },
            itemCount: snapshot.data.length,
          );
        } else {
          return Container();
        }
      },
    );
  }
}

/// 招待されているルーム一覧
class _WaitingRoomListWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _WaitingRoomListWidgetState();
}

class _WaitingRoomListWidgetState extends State<_WaitingRoomListWidget> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var bloc = Provider.of<RoomListBloc>(context, listen: false);
    bloc.fetchWaitingRooms();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    // TODO: implement build
    return _WaitingRoomListContainerWidget();
  }

  @override
  bool get wantKeepAlive => true;
}

class _WaitingRoomListContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<RoomListBloc>(context, listen: false);
    return StreamBuilder<List<DocumentSnapshot>>(
      stream: bloc.waitingRoomStream,
      builder: (context, snapshot) {
        // データを持っていたらリストを表示させる
        if(snapshot.hasData) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black38),
                  ),
                ),
                child: ListTile(
                  leading: const Icon(Icons.home),
                  title: Text(
                    snapshot.data[index]["name"].toString(),
                    style: const TextStyle(fontSize: 20),),
                  onTap: () => _showConfirmLogoutDialog(context, snapshot.data[index])
                ),
              );
            },
            itemCount: snapshot.data.length,
          );
        } else {
          return Container();
        }
      },
    );
  }

  /// グループに参加するかどうかを表示する処理
  void _showConfirmLogoutDialog(BuildContext context, DocumentSnapshot document) {

    var bloc = Provider.of<RoomListBloc>(context, listen: false);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Center(
              child: const Text('招待されています')
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  'この部屋に参加しますか?',
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    child: const Text('OK'),
                    onPressed: () async {
                      await Navigator.of(context).pop();
                      await bloc.joinRoom(document.reference);
                      _showCompletedDialog(context, document);
                    },
                  ),
                  SizedBox(
                    height: 20,
                    width: 1,
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                  FlatButton(
                    child: const Text(('Cancel')),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              )
            ],
          ),
        );
      }
    );
  }

  /// グループに参加したことを表示する処理
  void _showCompletedDialog(BuildContext context, DocumentSnapshot document) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('参加しました！'),
          content: const Text('この部屋に参加しました！'),
          actions: <Widget>[
            FlatButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => TopImagesPage(document)))
            ),
          ],
        );
      }
    );
  }
}
