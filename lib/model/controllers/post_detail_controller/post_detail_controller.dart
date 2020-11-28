import 'dart:developer';
import 'dart:io';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_share_app/model/controllers/post_detail_controller/post_detail_state.dart';
import 'package:image_share_app/model/entities/image.entity.dart';
import 'package:image_share_app/model/entities/pdf.entity.dart';
import 'package:image_share_app/model/entities/post.entity.dart';
import 'package:image_share_app/model/entities/room.entity.dart';
import 'package:image_share_app/model/entities/user.entity.dart';
import 'package:image_share_app/services/index.dart';
import 'package:state_notifier/state_notifier.dart';

// ignore: top_level_function_literal_block
final postDetailController = StateNotifierProvider((ref) {
  final _user = ref.watch(userStore.state);
  final _room = ref.watch(roomStore.state);
  final _psot = ref.watch(postStore.state);
  return PostDetailController(
    _user,
    _room,
    _psot,
    FirestoreService(),
    FilePickerService(),
  );
});

class PostDetailController extends StateNotifier<PostDetailState> {
  PostDetailController(
    this._user,
    this._room,
    this._post,
    this._firestoreService,
    this._filePickerService,
  ) : super(const PostDetailState()) {
    pageController = PageController(initialPage: state.currentIndex);
    getPostContent();
  }

  PageController pageController;
  final UserState _user;
  final RoomState _room;
  final PostState _post;
  final FirestoreService _firestoreService;
  final FilePickerService _filePickerService;

  void switchIndex(int index) {
    state = state.copyWith(currentIndex: index);
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
  }

  void switchMainImage(int index) {
    state = state.copyWith(imageIndex: index);
  }

  Future<void> pickUpImage() async {
    state = state.copyWith(isLoading: true);
    try {
      final List<File> _pickedImages = await _filePickerService.getImageFile();
      final List<ImageState> results = await _firestoreService.addImages(
        _user.uid,
        _room.id,
        _post.id,
        _pickedImages,
      );
      final newImages = state.images;
      newImages.addAll(results);
      state = state.copyWith(isLoading: false, error: null, images: newImages);
    } catch (error) {
      log(error.toString());
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  Future<void> pickUpPdf() async {
    state = state.copyWith(isLoading: true);
    try {
      final List<File> _pickedPdfs = await _filePickerService.getPdfFile();
      final List<PdfState> results = await _firestoreService.addPDFs(
        _user.uid,
        _room.id,
        _post.id,
        _pickedPdfs,
      );

      final pdfDocs = await Future.wait(
          results.map((e) => PDFDocument.fromURL(e.pdfUrl)).toList());

      final thumbnails = await Future.wait(
        pdfDocs.map(
          (e) => e.get(
            minScale: 1,
            maxScale: 1,
          ),
        ),
      );

      final newPdfDocs = state.pdfs;
      final newPdfThumbnails = state.pdfsThumbnails;

      newPdfDocs.addAll(pdfDocs);
      newPdfThumbnails.addAll(thumbnails);

      state = state.copyWith(
        isLoading: false,
        error: null,
        pdfs: newPdfDocs,
        pdfsThumbnails: newPdfThumbnails,
      );
    } catch (error) {
      log(error.toString());
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  Future<void> getPostContent() async {
    state = state.copyWith(isLoading: true);
    try {
      final images = await _firestoreService.getPostImages(_room.id, _post);
      final pdfs = await _firestoreService.getPostPdfs(_room.id, _post);

      final pdfDocs = await Future.wait(
          pdfs.map((e) => PDFDocument.fromURL(e.pdfUrl)).toList());

      final thumbnails = await Future.wait(
        pdfDocs.map(
          (e) => e.get(
            minScale: 1,
            maxScale: 1,
          ),
        ),
      );

      state = state.copyWith(
        isLoading: false,
        error: null,
        images: images,
        pdfs: pdfDocs,
        pdfsThumbnails: thumbnails,
      );
    } catch (error) {
      log(error.toString());
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
