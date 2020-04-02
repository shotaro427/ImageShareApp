
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:image_share_app/Entities/image_entity/image_entity.dart';
import 'package:image_share_app/Entities/room_entity/room_info_entity.dart';
import 'package:image_share_app/models/image_list/top_image_bloc.dart';
import 'package:image_share_app/repositories/image_list_repositories/top_image_repository.dart';
import 'package:image_share_app/widgets/image_detail/image_detail_page.dart';
import 'package:image_share_app/widgets/room_settings/room_settings_page.dart';
import 'package:image_share_app/widgets/top_image_list/image_upload_page.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class TopImagesPage extends StatelessWidget {

  final RoomInfoEntity _roomInfoEntity;

  TopImagesPage(this._roomInfoEntity);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<TopImageListStateNotifier, TopImageListState>(create: (_) => TopImageListStateNotifier(TopImageRepository(_roomInfoEntity.roomId)),),
        Provider<RoomInfoEntity>.value(value: _roomInfoEntity),
        StateNotifierProvider<SearchBarStateNotifier, SearchBarState>(create: (_) => SearchBarStateNotifier(),)
      ],
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Scaffold(
              appBar: AppBar(
                title: Builder(
                    builder: (context) {
                      return context.watch<SearchBarState>().isSearchMode
                          ? TextField(
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                fillColor: Colors.lightBlueAccent,
                                filled: true,
                                prefixIcon: const Icon(Icons.search, color: Colors.white,),
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.clear, color: Colors.white,),
                                  onPressed: () => context.read<SearchBarStateNotifier>().switchSearchingMode(),
                                ),
                                hintText: 'キーワードを入力',
                                hintStyle: const TextStyle(color: Colors.white),
                                border: InputBorder.none,
                              ),
                              onSubmitted: (searchText) => context.read<TopImageListStateNotifier>().searchImages(keyWord: searchText),
                            )
                          : Text(_roomInfoEntity.name);
                    }
                ),
                actions: <Widget>[
                  Builder(
                    builder: (context) {
                      return Visibility(
                        visible: !context.watch<SearchBarState>().isSearchMode,
                        child: IconButton(
                          icon: const Icon(Icons.search, color: Colors.white,),
                          onPressed: () => context.read<SearchBarStateNotifier>().switchSearchingMode(),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings, color: Colors.white,),
                    // TODO: 設定画面のコンストラクタの作成
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RoomSettingsPage(_roomInfoEntity))),
                  ),
                ],
              ),
              body: _ImagesWidget(),
              floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ImageUploadPage(_roomInfoEntity.roomId))),
              ),
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
    final _roomInfoEntity = context.read<RoomInfoEntity>();
    return GestureDetector(
      // TODO: 画像詳細画面のコンストラクタの設定
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ImageDetailPage(_entity, _roomInfoEntity))),
      child: Card(
        elevation: 10,
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: FadeInImage.memoryNetwork(
                fit: BoxFit.fitWidth,
                placeholder: kTransparentImage,
                image: (_entity.url != null) ? _entity.url : '',
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