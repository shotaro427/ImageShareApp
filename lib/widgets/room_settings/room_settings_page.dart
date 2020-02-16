

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_share_app/models/room_settings_bloc.dart';
import 'package:image_share_app/widgets/room_settings/add_member_page.dart';
import 'package:provider/provider.dart';

class RoomSettingsPage extends StatelessWidget {

  final DocumentSnapshot _roomInfo;

  RoomSettingsPage(this._roomInfo);

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_roomInfo['name']),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add, color: Colors.white,),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddMemberPage(_roomInfo.reference))),
          )
        ],
      ),
      body: RoomSettingsBodyPage(_roomInfo),
    );
  }
}

class RoomSettingsBodyPage extends StatelessWidget {

  final DocumentSnapshot _roomInfo;

  RoomSettingsBodyPage(this._roomInfo);

  @override
  Widget build(BuildContext context) {
    return Provider<RoomSettingsBloc>(
      create: (_) => RoomSettingsBloc(_roomInfo),
      dispose: (_, bloc) => bloc.dispose(),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black38)
                )
            ),
            child: Center(
              child: Text(
                'あなた',
                style: Theme.of(context).textTheme.headline,
              ),
            ),
          ),
          // 自分の名前
          _MyProfileInfoWidget(),
          // メンバー一覧のヘッダー
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black38)
                )
            ),
            child: Center(
              child: Text(
                '参加している人',
                style: Theme.of(context).textTheme.headline,
              ),
            ),
          ),
          // メンバー一覧
          RoomMembersPage(),
        ],
      )
    );
  }
}

// 自分の名前を表示するWidget
class _MyProfileInfoWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<RoomSettingsBloc>(context, listen: false);
    _bloc.fetchRoomMembersWithLoading();
    return StreamBuilder<DocumentSnapshot>(
      stream: _bloc.myProfileStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            margin:  const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black38)
                )
            ),
            child: ListTile(
              title: Text(
                (snapshot.data.data['nickName'] != null) ? snapshot.data.data['nickName'].toString() : '名無し',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          );
        } else {
          return Container(
            margin:  const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black38)
                )
            ),
            child: const ListTile(
              title: Text(
                '名無し',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          );
        }
      },
    );
  }
}

// 部屋に参加しているメンバーの名前を表示するWidget
class RoomMembersPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<RoomSettingsBloc>(context, listen: false);
    _bloc.fetchRoomMembersWithLoading();
    return StreamBuilder<List<DocumentSnapshot>>(
      stream: _bloc.participantsStream,
      builder: (context, snapshot) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            if (snapshot.hasData) {
              return Container(
                margin:  const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black38)
                  )
                ),
                child: ListTile(
                  title: Text(
                    (snapshot.data[index].data['nickName'] != null) ? snapshot.data[index].data['nickName'].toString() : 'GUEST${index + 1}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
          itemCount: (snapshot.hasData) ? snapshot.data.length : 0,
        );
      },
    );
  }
}