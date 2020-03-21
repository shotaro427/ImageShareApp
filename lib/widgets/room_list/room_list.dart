import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:image_share_app/models/room_list_model/waiting_room_list_model.dart';
import 'package:image_share_app/repositories/room_list_repository/waiting_room_list_repository.dart';
import 'package:image_share_app/widgets/room_list/waiting_room_list_page.dart';
import 'package:provider/provider.dart';
import 'joined_room_list_page.dart';
import 'package:image_share_app/widgets/room_list/create_room_page.dart';
import 'package:image_share_app/models/room_list_model/room_list_model.dart';
import 'package:image_share_app/repositories/room_list_repository/joined_room_list_repository.dart';
import 'package:image_share_app/widgets/sing_in/sign_in_page.dart';

class RoomListPage extends StatelessWidget {
  final RoomListRepository _repository;

  RoomListPage(this._repository);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<JoinedRoomListStateNotifier, JoinedRoomListState>(create: (_) => JoinedRoomListStateNotifier(RoomListRepository())),
        StateNotifierProvider<WaitingRoomListStateNotifier, WaitingRoomListState>(create: (_) => WaitingRoomListStateNotifier(WaitingRoomListRepository())),
      ],
      child: _RoomListsWidget()
    );
  }
}

class _RoomListsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                RoomListContainerWidget(),
                WaitingRoomListContainerWidget()
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              tooltip: "ルームを追加",
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CreateRoomPage(RoomListRepository()))),
            ),
          ),
        ),
//        _LoadingWidget(),
      ],
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

class _LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.read<JoinedRoomListState>().maybeWhen(
      null,
      loading: () => const DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0x44000000),
        ),
        child: Center(child: const CircularProgressIndicator()),
      ),
      orElse: () => const SizedBox.shrink(),
    );
  }
}

class _LoadingWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return context.watch<WaitingRoomListState>().maybeWhen(
      () => const SizedBox.shrink(),
      loading: () => const DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0x44000000),
        ),
        child: Center(child: const CircularProgressIndicator()),
      ),
      orElse: () => const SizedBox.shrink(),
    );
  }
}
