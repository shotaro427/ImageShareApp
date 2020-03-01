
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_share_app/models/image_detail_bloc.dart';
import 'package:image_share_app/widgets/image_detail/image_detail_view_page.dart';
import 'package:provider/provider.dart';

class ImageDetailPage extends StatelessWidget {

  final DocumentSnapshot imageDocument;

  ImageDetailPage(this.imageDocument);

  @override
  Widget build(BuildContext context) {
    return Provider<ImageDetailBloc>(
      create: (_) => ImageDetailBloc(imageDocument),
      dispose: (_ ,bloc) => bloc.dispose(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('詳細'),
        ),
        backgroundColor: Colors.black,
        body: _LayoutDetailImage(imageDocument),
      ),
    );
  }
}

class _LayoutDetailImage extends StatelessWidget {

  final DocumentSnapshot imageDocument;

  _LayoutDetailImage(this.imageDocument);

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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(3),
              child: GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ImageDetailViewPage(imageDocument.data['originalUrl'], imageDocument.data['title']))),
                child: Image(
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width,
                  image: NetworkImage(imageDocument.data['originalUrl']),
                ),
              ),
            ),
            const SizedBox(height: 3),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white
                ),
                child: Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
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
                          IconButton(
                            icon: (snapshot.hasData && snapshot.data) ? const Text('保存') : const Text('編集'),
                            onPressed: () {
                              _bloc.changeEditableState(!snapshot.data);
                            },
                          )
                        ],
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
                                decoration: const InputDecoration.collapsed(
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  hintText: 'メモ',
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
              ),
            )
          ],
        );
      }
    );
  }
}
