
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_share_app/Entities/image_entity/image_entity.dart';
import 'package:image_share_app/Entities/room_entity/room_info_entity.dart';
import 'package:image_share_app/models/image_detail_bloc.dart';
import 'package:image_share_app/widgets/commont_widgets/common_loading_widget.dart';
import 'package:image_share_app/widgets/image_detail/image_detail_view_page.dart';
import 'package:provider/provider.dart';

class ImageDetailPage extends StatelessWidget {

  final ImageEntity _imageEntity;
  final RoomInfoEntity _roomInfoEntity;

  ImageDetailPage(this._imageEntity, this._roomInfoEntity);

  @override
  Widget build(BuildContext context) {
    return Provider<ImageDetailBloc>(
      create: (_) => ImageDetailBloc( _imageEntity, _roomInfoEntity),
      dispose: (_ ,bloc) => bloc.dispose(),
      child: Stack(
        children: <Widget>[
          Scaffold(
            appBar: AppBar(
              title: const Text('詳細'),
            ),
            body: _LayoutDetailImage(_imageEntity),
          ),
          CommonLoadingWidget<ImageDetailBloc>(dialogTitle: '投稿の変更',)
        ],
      ),
    );
  }
}

class _LayoutDetailImage extends StatelessWidget {

  final ImageEntity _entity;

  _LayoutDetailImage(this._entity);

  @override
  Widget build(BuildContext context) {
    ImageDetailBloc _bloc = Provider.of<ImageDetailBloc>(context, listen: false);

    return StreamBuilder<bool>(
      initialData: false,
      stream: _bloc.changeEditableStream,
      builder: (context, snapshot) {
        return Column(
          children: <Widget>[
            Container(
              height: 300,
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ImageDetailViewPage(_entity.originalUrl, _entity.title))),
                child: Image(
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width,
                  image: NetworkImage(_entity.originalUrl),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    const BoxShadow(
                      color: Colors.black,
                      blurRadius: 20,
                      spreadRadius: 5,
                      offset: const Offset(0, 10,),
                    ),
                  ],
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Center(
                      child: const SizedBox(
                        width: 60,
                        height: 3,
                        child: const DecoratedBox(
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            child: TextFormField(
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),
                              controller: _bloc.titleController,
                              decoration: const InputDecoration.collapsed(
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                hintText: 'タイトル',
                              ),
                              // 編集モードのときはTextFormFieldの編集を可能にする
                              enabled: (snapshot.hasData && snapshot.data),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              OutlineButton(
                                child: (snapshot.hasData && snapshot.data) ? const Text('保存') : const Text('編集'),
                                onPressed: () {
                                  _bloc.changeEditableState(snapshot.data);
                                },
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.greenAccent,
                                    width: 3
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              Visibility(
                                child: IconButton(
                                  icon: const Icon(Icons.close),
                                  onPressed: () {
                                    _bloc.cancelEdit();
                                  },
                                ),
                                visible: (snapshot.hasData && snapshot.data),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 25,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Icon(Icons.local_offer, color: Colors.grey,),
                            const Text('タグ', style: TextStyle(color: Colors.grey),)
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Icon(Icons.note, color: Colors.grey,),
                            const Text('メモ', style: TextStyle(color: Colors.grey),)
                          ],
                        ),
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.only(left: 30),
                            child: TextFormField(
                              style: const TextStyle(
                                  color: Colors.black
                              ),
                              controller: _bloc.memoController,
                              decoration: InputDecoration.collapsed(
                                hintStyle: TextStyle(
                                  color: (snapshot.hasData && snapshot.data) ? Colors.grey : Colors.transparent,
                                ),
                                hintText: 'メモを書き込めます',
                              ),
                              // 編集モードのときはTextFormFieldの編集を可能にする
                              enabled: (snapshot.hasData && snapshot.data),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      }
    );
  }
}
