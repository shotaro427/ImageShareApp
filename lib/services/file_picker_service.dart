import 'dart:io';

import 'package:file_picker/file_picker.dart';

class FilePickerService {
  Future<List<File>> getPdfFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: true,
    );

    if (result != null) {
      final List<File> files = result.paths.map((path) => File(path)).toList();

      if (files.length > 5) {
        throw Exception('too many files');
      }
      return files;
    } else {
      throw Exception('can not pick file');
    }
  }

  Future<List<File>> getImageFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null) {
      final List<File> files = result.paths.map((path) => File(path)).toList();

      if (files.length > 5) {
        throw Exception('too many files');
      }
      return files;
    } else {
      throw Exception('can not pick file');
    }
  }

  Future<File> getSingleImageFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null) {
      final File file = File(result.files.single.path);

      return file;
    } else {
      throw Exception('can not pick file');
    }
  }
}
