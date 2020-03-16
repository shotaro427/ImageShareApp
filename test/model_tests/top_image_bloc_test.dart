

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_share_app/models/top_image_bloc.dart';
import 'package:mockito/mockito.dart';

import 'room_list_bloc_test.dart';

class _MockTopImageRepository extends Mock implements TopImageRepository {}

main() {

  final data = {
    "name": "name",
    "roomId": "roomId"
  };

  test('fetchImages()のテスト', () async {

    final _MockTopImageRepository _mockTopImageRepository = _MockTopImageRepository();

    DocumentSnapshot _doc = DocumentSnapshotMock('uid', data);
    var target = TopImagesBloc(_mockTopImageRepository);

    when(_mockTopImageRepository.fetchImages()).thenAnswer((_) => Future.value());

    await target.fetchImages();

//    expect(target.imagesValue, emits([]));
    target.imagesValue.listen(
      expectAsync1((event) {
        expect(event.length, 0);
      })
    );

  });
}