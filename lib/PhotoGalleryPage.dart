
import 'package:flutter/material.dart';
import 'package:flutterfly/Constants.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'ImageBean.dart';

//https://my.oschina.net/u/4383341/blog/3462539
class PhotoGalleryPage extends StatefulWidget {
  final List photoList;
  final int index;

  PhotoGalleryPage({this.photoList, this.index});

  @override
  _PhotoGalleryPageState createState() => _PhotoGalleryPageState();
}

class _PhotoGalleryPageState extends State<PhotoGalleryPage> {

  int currentIndex = 0;
  int length;
  int title;

  @override
  void initState() {
    currentIndex = widget.index;
    length = widget.photoList.length;
    title = currentIndex + 1;
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
      title = index + 1;
    });
  }

  Widget build(BuildContext context) {
    ImageBean data = widget.photoList[currentIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text('$title / $length'),
        centerTitle: true,
      ),
      body: Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              PhotoViewGallery.builder(
                scrollDirection: Axis.horizontal,
                scrollPhysics: const BouncingScrollPhysics(),
                builder: (BuildContext context, int index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: NetworkImage(data.url),
                    initialScale: PhotoViewComputedScale.contained * 1,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(Constants.errPath);
                    },
                  );
                },
                itemCount: widget.photoList.length,
                backgroundDecoration: BoxDecoration(
                  color: Colors.black,
                ),
                pageController: PageController(initialPage: currentIndex),
                onPageChanged: onPageChanged,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  data.name,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 17.0, decoration: null),
                ),
              )
            ],
          )),
    );
  }
}
