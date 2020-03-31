
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:image_share_app/Entities/room_entity/room_info_entity.dart';
import 'package:image_share_app/models/room_settings_bloc.dart';
import 'package:image_share_app/repositories/room_settings_repositories/room_setting_repository.dart';
import 'package:image_share_app/widgets/room_settings/editing_profile_page.dart';
import 'package:provider/provider.dart';

class RoomSettingsPage extends StatelessWidget {

  final RoomInfoEntity _roomInfo;

  RoomSettingsPage(this._roomInfo);

  @override 
  Widget build(BuildContext context) {
    return StateNotifierProvider<RoomSettingsStateNotifier, RoomSettingsState>(
      create: (_) => RoomSettingsStateNotifier(RoomSettingsRepository(_roomInfo)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(_roomInfo.name),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add, color: Colors.white,),
              // TODO: AddMemberPageを実装する
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Placeholder())),
            )
          ],
        ),
        body: _RoomSettingsBodyPage(),
      ),
    );
  }
}

class _RoomSettingsBodyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
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
        _RoomMembersPage(),
      ],
    );
  }
}

// 自分の名前を表示するWidget
class _MyProfileInfoWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder<RoomSettingsState>(
      stateNotifier: context.read<RoomSettingsStateNotifier>(),
      builder: (context, state, _) {
        return state.maybeWhen(
                () => createPlaceholderWidget(context),
            success: (myProfile, _) => Container(
              margin:  const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black38)
                  )
              ),
              child: ListTile(
                  title: Text(
                    (myProfile.name != null) ? myProfile.name : '名無し',
                    style: const TextStyle(fontSize: 20),
                  ),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditingProfilePage()))
              ),
            ),
            orElse: () => createPlaceholderWidget(context),
        );
      },
    );
  }

  /// デフォルトのwidget
  Widget createPlaceholderWidget(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.black38)
          )
      ),
      child: ListTile(
          title: const Text(
            '名無し',
            style: const TextStyle(fontSize: 20),
          ),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditingProfilePage()))
      ),
    );
  }
}

// 部屋に参加しているメンバーの名前を表示するWidget
class _RoomMembersPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder<RoomSettingsState>(
      stateNotifier: context.read<RoomSettingsStateNotifier>(),
      builder: (context, state, _) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return state.maybeWhen(
                    () => Container(),
                success: (_, members) => Container(
                  margin:  const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black38)
                      )
                  ),
                  child: ListTile(
                    title: Text(
                      (members[index].name != null) ? members[index].name : 'GUEST${index + 1}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                orElse: () => Container()
            );
          },
          itemCount: state.maybeWhen(
                  () => 0,
              success: (_, members) => members.length,
              orElse: () => 0
          ),
        );
      },
    );
  }
}