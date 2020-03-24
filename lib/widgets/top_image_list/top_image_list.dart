
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:image_share_app/Entities/image_entity/image_entity.dart';
import 'package:image_share_app/Entities/room_entity/room_info_entity.dart';
import 'package:image_share_app/models/image_list/top_image_bloc.dart';
import 'package:image_share_app/widgets/top_image_list/image_upload_page.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class TopImagesPage extends StatelessWidget {

  final RoomInfoEntity _roomInfoEntity;

  TopImagesPage(this._roomInfoEntity);

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<TopImageListStateNotifier, TopImageListState>(
      create: (_) => TopImageListStateNotifier(TopImageRepository(_roomInfoEntity.roomId)),
      child: Stack(
        children: <Widget>[
          Scaffold(
            appBar: AppBar(
              title: Text(_roomInfoEntity.name),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.settings, color: Colors.white,),
                  // TODO: 設定画面のコンストラクタの作成
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Placeholder())),
                )
              ],
            ),
            body: _ImagesWidget(),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ImageUploadPage(_roomInfoEntity.roomId))),
            ),
          ),
          _LoadingWidget()
        ],
      ),
    );
  }
}

class _ImagesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TopImageListStateNotifier notifier = context.read<TopImageListStateNotifier>();
    return RefreshIndicator(
      onRefresh: notifier.refresh,
      child: Container(
        child: StateNotifierBuilder<TopImageListState>(
          stateNotifier: notifier,
          builder: (context, state, _) {
            return state.maybeWhen(
              () => const SizedBox.shrink(),
              success: (images) {
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  padding: const EdgeInsets.all(4),
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return _ImageTile(images[index]);
                  },
                  staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}

/// 一覧の画像のセル
class _ImageTile extends StatelessWidget {

  final ImageEntity _entity;

  _ImageTile(this._entity);

  @override 
  Widget build(BuildContext context) {
    return GestureDetector(
      // TODO: 画像詳細画面のコンストラクタの設定
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Placeholder())),
      child: Card(
        elevation: 10,
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: FadeInImage.memoryNetwork(
                fit: BoxFit.fitWidth,
                placeholder: kTransparentImage,
                image: _entity.url,
                fadeInCurve: Curves.easeInOut,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: new Column(
                children: <Widget>[
                  Text(
                    (_entity.title != null) ? _entity.title : "名無し",
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

class _LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return context.watch<TopImageListState>().maybeWhen(
      null,
      loading: () => const DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0x44000000),
        ),
        child: Center(child: const CircularProgressIndicator()),
      ),
      orElse: () => const SizedBox.shrink(),
    );
  }
}