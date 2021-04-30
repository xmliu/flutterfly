import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageSinglePage extends StatelessWidget {

  String url;

  // 接收传参
  ImageSinglePage({@required this.url});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '单张大图',
      home: Scaffold(
          backgroundColor: Colors.black,
          body: InkWell(
            onTap: () {
              Navigator.of(context).pop(1);// 点击finish当前页，回到列表
            },
            child: Image.network(
              url,
              width: MediaQuery.of(context).size.width, // 宽高为全屏幕
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.scaleDown, // 填充，不按比例缩放
            ),
          )),
    );
  }

}