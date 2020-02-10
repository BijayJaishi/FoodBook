//import 'package:flutter/material.dart';
//import 'dart:io';
//import 'dart:async';
//
//import 'package:image_gallery/image_gallery.dart';
//
//class GridImage extends StatefulWidget {
//  @override
//  _GridImageState createState() => new _GridImageState();
//}
//
//class _GridImageState extends State<GridImage> {
//  List<Object> allImage = new List();
//
//  @override
//  void initState() {
//    super.initState();
//    loadImageList();
//  }
//
//  Future<void> loadImageList() async {
//    List allImageTemp;
//    allImageTemp = await FlutterGallaryPlugin.getAllImages;
//
//    setState(() {
//      this.allImage = allImageTemp;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(body: _buildGrid());
//  }
//
//  Widget _buildGrid() {
//    return GridView.extent(
//        maxCrossAxisExtent: 150.0,
//        // padding: const EdgeInsets.all(4.0),
//        mainAxisSpacing: 4.0,
//        crossAxisSpacing: 4.0,
//        children: _buildGridTileList(allImage.length));
//  }
//
//  List<Container> _buildGridTileList(int count) {
//    return List<Container>.generate(
//        count,
//        (int index) => Container(
//                child: Image.file(
//              File(allImage[index].toString()),
//              width: 96.0,
//              height: 96.0,
//              fit: BoxFit.contain,
//            )));
//  }
//}





import 'package:flutter/material.dart';
import 'package:flutter_widget_gallery/gallery/gallery.dart';

class GridImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),

      body: Gallery(
        activeItemColor: Color(0xFF6A0AEA),
        backgroundColor: Color(0xFFF3F3F3),
        carouselBackgroundColor: Color(0xAAE3E3E3),
        children: List<Widget>.generate(
          10,
              (index) => Image.network(
            'https://picsum.photos/960/540?image=$index',
            fit: BoxFit.cover,
          ),
        ),
        onChildTap: (index) => print('tapped on $index'),
        onChildLongPress: (index) => print('long press on $index'),
      ),
    );
  }
}





