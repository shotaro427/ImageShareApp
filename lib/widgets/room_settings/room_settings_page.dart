

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
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddMemberPage())),
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
      child: RoomMembersPage()
    );
  }
}

class RoomMembersPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<RoomSettingsBloc>(context);
    _bloc.fetchRoomMembersWithLoading();
    return StreamBuilder<List<DocumentSnapshot>>(
      stream: _bloc.participantsStream,
      builder: (context, snapshot) {
        return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              if (snapshot.hasData) {
                return ListTile(
                  title: Text(snapshot.data[index].data['email'].toString()),
                );
              } else {
                return Container();
              }
            },
            itemCount: 1,
        );
      },
    );
  }
}