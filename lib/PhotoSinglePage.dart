import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

// ignore: must_be_immutable
class PhotoSinglePage extends StatelessWidget {
  String url;

  // 接收传参
  PhotoSinglePage({@required this.url});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '单张大图',
      home: Scaffold(
          body: InkWell(
            onTap: () {
              Navigator.of(context).pop(1);// 点击finish当前页，回到列表
            },
            child: PhotoView(
              imageProvider: NetworkImage(url),
            ),
          )),
    );
  }
}