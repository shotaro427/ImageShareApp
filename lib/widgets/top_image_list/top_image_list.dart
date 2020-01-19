

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          return GridView.builder(
            itemCount: snapshot.data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ImageDetailPage(snapshot.data[index]))),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                  ),
                  child: Image(
                    fit: BoxFit.fitWidth,
                    image: (snapshot.hasData)
                      ? NetworkImage(snapshot.data[index].data['url'])
                      : Card(color: Colors.orange,),
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}