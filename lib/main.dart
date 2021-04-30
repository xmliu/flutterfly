// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfly/Constants.dart';

import 'FadeOut.dart';
import 'ImageBean.dart';
import 'ImageSinglePage.dart';
import 'PhotoGalleryPage.dart';
import 'PhotoSinglePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      debugShowCheckedModeBanner: false,
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  //动态列表数据
  List listData = getImageDataList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Xmliu GridView'),
        ),
        body: Center(
          child: _buildGridView(),
        ));
  }

  Widget _buildGridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          childAspectRatio: 1 // 宽高比例
          ),
      itemCount: listData.length,
      itemBuilder: _buildGridData,
      padding: const EdgeInsets.all(2),
    );
  }

  Widget _buildGridData(context, index) {
    ImageBean data = listData[index];
    return Container(
      child: InkWell(
          onLongPress: () {
            print('长按$index');
          },
          onTap: () {
            // 单击事件，执行页面跳转并传参 FadeRoute or MaterialPageRoute
            // （1）跳转到单张大图查看页面，不可缩放
            // Navigator.push(context, FadeRoute(page:ImageSinglePage(url: data.url))); //listData[index][Constants.imgUrl]
            // （2）跳转到单张大图查看页面，可缩放
            // Navigator.push(context, FadeRoute(page:PhotoSinglePage(url: data.url)));
            // （3）跳转到多张大图查看页面，可缩放
            Navigator.push(
                context,
                FadeRoute(
                    page: PhotoGalleryPage(
                  index: index,
                  photoList: listData,
                )));
          },
          child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Stack(
                fit: StackFit.passthrough,
                children: [
                  Image.network(
                    data.url,//listData[index][Constants.imgUrl]
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(Constants.errPath);
                    },
                  ),
                  Text(
                    data.name,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ))),
      // 宫格视图外框
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border:
              Border.all(color: Color.fromRGBO(200, 200, 200, 0.9), width: 1)),
    );
  }
}

// 测试数据
getImageDataList(){
  List<ImageBean> list = [];
  for(int i = 0;i < 10; i++){
    ImageBean imageBean = new ImageBean();
    imageBean.name = "图${i+1}";
    imageBean.url = "https://scpic.chinaz.net/Files/pic/pic9/202104/apic3215$i.jpg";
    list.add(imageBean);
  }
  for(int i = 0;i < 10; i++){
    ImageBean imageBean = new ImageBean();
    imageBean.name = "图${i+10+1}";
    imageBean.url = "https://scpic.chinaz.net/Files/pic/pic9/202104/apic3216$i.jpg";
    list.add(imageBean);
  }
  return list;
}


