
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_share_app/models/top_image_bloc.dart';
import 'package:image_share_app/widgets/commont_widgets/common_loading_widget.dart';
import 'package:image_share_app/widgets/image_detail/image_detail_page.dart';
import 'package:image_share_app/widgets/room_settings/room_settings_page.dart';
import 'package:image_share_app/widgets/top_image_list/image_upload_page.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class TopImagesPage extends StatelessWidget {

  final DocumentSnapshot roomInfo;

  TopImagesPage(this.roomInfo);

  @override
  Widget build(BuildContext context) {
    return Provider<TopImagesBloc>(
      create: (_) => TopImagesBloc(TopImageRepository(roomInfo.reference.path)),
      dispose: (_, bloc) => bloc.dispose(),
      child: Stack(
        children: <Widget>[
          Scaffold(
            appBar: AppBar(
              title: Text(roomInfo["name"].toString()),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.settings, color: Colors.white,),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RoomSettingsPage(roomInfo))),
                )
              ],
            ),
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
    return RefreshIndicator(
      onRefresh: bloc.refreshImages,
      child: Container(
        child: StreamBuilder<List<DocumentSnapshot>>(
          stream: bloc.imagesValue,
          initialData: const [],
          builder: (context, snapshot) {
            return StaggeredGridView.countBuilder(
              controller: bloc.scrollController,
              crossAxisCount: 4,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              padding: const EdgeInsets.all(4),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return _ImageTile(snapshot.data[index]);
              },
              staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
            );
          },
        ),
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
        elevation: 10,
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: FadeInImage.memoryNetwork(
                fit: BoxFit.fitWidth,
                placeholder: kTransparentImage,
                image: _data['url'],
                fadeInCurve: Curves.easeInOut,
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