

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
part 'add_member_bloc.freezed.dart';

@freezed
abstract class AddMemberState with _$AddMemberState {
  const factory AddMemberState() = _AddMemberState;
  const factory AddMemberState.loading() = Loading;
  const factory AddMemberState.success() = Success;
  const factory AddMemberState.error({@Default('') String message}) = ErrorDetails;
}

class AddMemberStateNotifier extends StateNotifier<AddMemberState> {

  AddMemberStateNotifier(): super(const AddMemberState());

  
}

class AddMemberBloc {

  inviteUser(String email, DocumentReference roomRef) async {
    
    final Query _query = Firestore.instance
        .collection("users")
        .where("email", isEqualTo: email);

    DocumentReference _userRef;

    await _query.getDocuments().then((docs) {
        _userRef = docs.documents.first.reference;
    }).catchError((e) => debugPrint(e.toString()));
    
    await _userRef.collection('waitingRooms').add({
      'room': roomRef
    });
  }
}