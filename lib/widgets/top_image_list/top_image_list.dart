

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_share_app/models/top_image_bloc.dart';
import 'package:image_share_app/widgets/commont_widgets/common_loading_widget.dart';
import 'package:image_share_app/widgets/image_detail/image_detail_page.dart';
import 'package:image_share_app/widgets/top_image_list/image_upload_page.dart';
import 'package:provider/provider.dart';

class TopImagesPage extends StatelessWidget {

  final DocumentSnapshot roomInfo;

  TopImagesPage(this.roomInfo);

  @override
  Widget build(BuildContext context) {
    return Provider<TopImagesBloc>(
      create: (_) => TopImagesBloc(roomInfo),
      dispose: (_, bloc) => bloc.dispose(),
      child: Stack(
        children: <Widget>[
          Scaffold(
            appBar: AppBar(title: Text(roomInfo["name"].toString()),),
            backgroundColor: Theme.of(context).backgroundColor,
            body: _ImagesWidget(),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ImageUploadPage(roomInfo.data["roomId"]);
                }));
                },
            ),
          ),
          CommonLoadingWidget<TopImagesBloc>(isShowDialog: false,)
        ]
      ),
    );
  }
}

class _ImagesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TopImagesBloc bloc = Provider.of<TopImagesBloc>(context);
    return Container(
      child: StreamBuilder<List<DocumentSnapshot>>(
        stream: bloc.imagesValue,
        initialData: const [],
        builder: (context, snapshot) {
          return StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            padding: const EdgeInsets.all(4),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) => _ImageTile(snapshot.data[index]),
            staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
          );
        },
      ),
    );
  }
}

/// 一覧の画像のセル
class _ImageTile extends StatelessWidget {

  final DocumentSnapshot _data;

  _ImageTile(this._data);

  @override 
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ImageDetailPage(_data))),
      child: Card(
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: FadeInImage.memoryNetwork(
                fit: BoxFit.fitWidth,
                placeholder: kTransparentImage,
                image: _data['url'],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: new Column(
                children: <Widget>[
                  Text(
                    (_data['title'] != null) ? _data['title'] : "名無し",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// フェードするアニメーション
final Uint8List kTransparentImage = new Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);