
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:image_share_app/Entities/room_entity/room_info_entity.dart';
import 'package:image_share_app/models/room_settings/room_settings_bloc.dart';
import 'package:image_share_app/repositories/room_settings_repositories/room_setting_repository.dart';
import 'package:image_share_app/widgets/room_settings/add_member_page.dart';
import 'package:image_share_app/widgets/room_settings/editing_profile_page.dart';
import 'package:provider/provider.dart';

class RoomSettingsPage extends StatelessWidget {

  final RoomInfoEntity _roomInfo;

  RoomSettingsPage(this._roomInfo);

  @override 
  Widget build(BuildContext context) {
    return StateNotifierProvider<RoomSettingsStateNotifier, RoomSettingsState>(
      create: (_) => RoomSettingsStateNotifier(RoomSettingsRepository(_roomInfo)),
      child: Stack(
        children: <Widget>[
          Scaffold(
            appBar: AppBar(
              title: Text(_roomInfo.name),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.group_add, color: Colors.white,),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddMemberPage(_roomInfo))),
                )
              ],
            ),
            body: _RoomSettingsBodyPage(),
          ),
          _LoadingWidget(),
        ],
      ),
    );
  }
}

class _RoomSettingsBodyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // 自分の名前
        _MyProfileInfoWidget(),
        // メンバー一覧のヘッダー
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            '参加している人',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.start,
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
          success: (myProfile, _) { 
            return GestureDetector(
                child: Card(
                  color: Theme.of(context).bannerTheme.backgroundColor,
                  elevation: 10,
                  margin: const EdgeInsets.all(5),
                  child: SizedBox(
                    height: 65,
                    child: Row(
                      children: [
                        const Padding(
                          padding: const EdgeInsets.only(left: 15, right: 10),
                          child: const Icon(Icons.account_circle),
                        ),
                        Text(
                          (myProfile.name != null) ? '${myProfile.name} (あなた)' : '未設定 (あなた)',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditingProfilePage((myProfile.name != null) ? myProfile.name : '未設定'))),
              );
            },
            orElse: () => createPlaceholderWidget(context),
        );
      },
    );
  }

  /// デフォルトのwidget
  Widget createPlaceholderWidget(BuildContext context) {
    return Card(
      color: Theme.of(context).bannerTheme.backgroundColor,
      elevation: 10,
      margin: const EdgeInsets.all(5),
      child: SizedBox(
        height: 65,
        child: Row(
          children: const [
            const Padding(
              padding: const EdgeInsets.only(left: 15, right: 10),
              child: const Icon(Icons.account_circle),
            ),
            const Text(
              '未設定',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
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
                success: (_, members) {
                  return Card(
                    color: Theme.of(context).bannerTheme.backgroundColor,
                    elevation: 10,
                    margin: const EdgeInsets.all(5),
                    child: SizedBox(
                      height: 65,
                      child: Row(
                        children: [
                          const Padding(
                            padding: const EdgeInsets.only(left: 15, right: 10),
                            child: const Icon(Icons.account_circle),
                          ),
                          Text(
                            (members[index].name != null) ? members[index].name : '未設定',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  );
                },
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

class _LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return context.watch<RoomSettingsState>().maybeWhen(
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
