import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final _picker = ImagePicker();

  /// ユーザーのローカルから画像を選択させて、取得する
  Future<File> getImageInGallery() async {
    final PickedFile _pickedFile =
        await _picker.getImage(source: ImageSource.gallery);
    return File(_pickedFile.path);
  }
}
