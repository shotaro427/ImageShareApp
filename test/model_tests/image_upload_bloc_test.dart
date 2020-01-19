

import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:image_share_app/models/image_upload_bloc.dart';
import 'package:mockito/mockito.dart';

class _MockImageUploadRepository extends Mock implements ImageUploadRepository {}

void main() {

  group("ImageUploadBlocのテスト", () {

    test('pickUpImage()のテスト', () async {

      ImageUploadRepository _repository = _MockImageUploadRepository();
      ImageUploadBloc target = ImageUploadBloc(_repository);

      when(_repository.getImageInGallery()).thenAnswer((_) => Future.value(File('test_resources/contacts.json')));

      target.pickUpImage();

      target.value.listen(
        expectAsync1((actual) async {
          final json = jsonDecode(await actual.readAsString());
          final contacts = json['contacts'];

          final seth = contacts.first;
          expect(seth['id'], 1);
          expect(seth['name'], 'Seth Ladd');

          final eric = contacts.last;
          expect(eric['id'], 2);
          expect(eric['name'], 'Eric Seidel');
        })
      );
    });
  });
}
