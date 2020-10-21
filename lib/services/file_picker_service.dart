import 'dart:io';

import 'package:file_picker/file_picker.dart';

class FilePickerService {
  Future<File> getPdfFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      File file = File(result.files.single.path);
      return file;
    } else {
      throw Exception('can not pick file');
    }
  }
}
