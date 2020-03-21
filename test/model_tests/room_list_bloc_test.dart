
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter_test/flutter_test.dart";
import 'package:image_share_app/models/room_list_model/room_list_model.dart';
import 'package:image_share_app/repositories/room_list_repository.dart';
import 'package:mockito/mockito.dart';

class DocumentSnapshotMock extends Mock implements DocumentSnapshot {
  final String documentID;
  final Map<String, dynamic> data;

  DocumentSnapshotMock(this.documentID, this.data);
}

class _MockRoomListRepository extends Mock implements RoomListRepository {}

main() {

  List<DocumentSnapshotMock> rooms = [];
  final data = {
    "name": "name",
    "roomId": "roomId"
  };

  setUp(() {
    rooms.add(DocumentSnapshotMock("uid", data));
  });

  group("room_list_blocのテスト", () {
    test("fetch()", () async {
       _MockRoomListRepository repository = _MockRoomListRepository();

       var target = RoomListBloc(repository);

       when(repository.fetchJoinedRooms()).thenAnswer((_) => Future.value(rooms));
       
       await target.fetchRooms();
       
       target.roomListStream.listen(
         expectAsync1((actual) {
           expect(actual.length, 1);
           expect(actual.first.data['name'], "name");
           expect(actual.first.data['roomId'], "roomId");
           expect(actual.first.documentID, "uid");
         })
       );
    });
  });
}