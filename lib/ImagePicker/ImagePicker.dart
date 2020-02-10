import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:newflutter/NotificationCard/notificationCArd.dart';
import 'package:newflutter/UI/DashBoard.dart';
import 'package:newflutter/UI/Profile.dart';
import 'package:newflutter/UI/curved_navigation.dart';
import 'package:photofilters/photofilters.dart';
import 'package:image/image.dart' as imageLib;
import 'package:image_picker/image_picker.dart';

class ImagePickerClass extends StatefulWidget {
  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePickerClass>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;

  int _page = 3;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

//  imageLib.Image _image;
//  String fileName;
//  Filter _filter;
//  List<Filter> filters = presetFitersList;
//
//  static List<Filter> presetFitersList;
//
////  static List<Filter> get presetFitersList => null;
//
//  Future getImage() async {
//    var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
//    fileName = basename(imageFile.path);
//    var image = imageLib.decodeImage(imageFile.readAsBytesSync());
//    image = imageLib.copyResize(image,height: 600,width: 600);
//    setState(() {
//      _image = image;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('Photo Filter Example'),
//      ),
//      body: new Container(
//        alignment: Alignment(0.0, 0.0),
//        child: _image == null
//            ? new Text('No image selected.')
//            : new PhotoFilterSelector(
//          image: _image,
//          filters: presetFiltersList,
//          filename: fileName,
//          loader: Center(child: CircularProgressIndicator()),
//        ),
//      ),
//      floatingActionButton: new FloatingActionButton(
//        onPressed: getImage,
//        tooltip: 'Pick Image',
//        child: new Icon(Icons.add_a_photo),
//      ),
//    );
//  }
//}

  imageLib.Image _image;
  String fileName;
  Filter _filter;
  List<Filter> filters = presetFitersList;

  static List<Filter> presetFitersList;

  var imageFile;

//
//// Select image from gallery or camera

//  Future<void> filterImage() async {
//    var selected = await ImagePicker.pickImage(source: ImageSource.camera != null ? ImageSource.gallery:ImageSource.camera);
//    fileName = basename(selected.path);
//    var image = imageLib.decodeImage(selected.readAsBytesSync());
////    image = imageLib.copyResize(image,height: 600,width: 600);
//    setState(() {
//      _image = image;
//      imageFile = selected;
//    });
//  }
//
//
//  Future<void> cropImage() async {
//    var croppedFile = await ImageCropper.cropImage(
//        sourcePath:imageFile.path,
//
//        aspectRatioPresets: [
//          CropAspectRatioPreset.square,
//          CropAspectRatioPreset.ratio3x2,
//          CropAspectRatioPreset.original,
//          CropAspectRatioPreset.ratio4x3,
//          CropAspectRatioPreset.ratio16x9
//        ],
//        androidUiSettings: AndroidUiSettings(
//            toolbarTitle: 'Cropper',
//            toolbarColor: Colors.deepOrange,
//            toolbarWidgetColor: Colors.white,
//            initAspectRatio: CropAspectRatioPreset.original,
//            lockAspectRatio: false),
//        iosUiSettings: IOSUiSettings(
//          minimumAspectRatio: 1.0,
//        )
//
//    );
//    fileName = basename(croppedFile.path);
//    var imagecrop = imageLib.decodeImage(croppedFile.readAsBytesSync());
////    imagecrop = imageLib.copyResize(imagecrop,height: 600,width: 600);
//    setState(() {
//      _image = imagecrop;
//      imageFile = croppedFile;
//    });
//  }
//
//  void _clear() {
//    setState(() {
//      _image = null;
//      imageFile = null;
//    });
//  }

//
  Future<void> pickImage(ImageSource imageSource) async {
    File selected = await ImagePicker.pickImage(source: imageSource);
//    compressFormatName(ImageCompressFormat.jpg);
    setState(() {
      imageFile = selected;
    });
  }

  Future<void> cropImage() async {
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        compressQuality: 88,
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));
    setState(() {
      imageFile = croppedFile;
    });
  }

  void _clear() {
    setState(() => imageFile = null);
  }

//
////  Future<void>showChoiceDialog(BuildContext context){
////    return showDialog(context: context,builder: (BuildContext context){
////      return AlertDialog(
////        content: SingleChildScrollView(
////          child: ListBody(
////            children: <Widget>[
////              GestureDetector(
////                child: Text("Gallery"),
////                onTap: (){
////
////                  pickImage(ImageSource.gallery);
////                },
////              ),
////              GestureDetector(
////                child: Text("Camera"),
////                onTap: (){
////
////                  pickImage(ImageSource.camera);
////                },
////              ),
////            ],
////          ),
////        ),
////      );
////    });
////
////  }
//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/images/logo.png',
          height: 30,
        ),
        actions: <Widget>[
          AspectRatio(
            aspectRatio: 1 / 1,
            child: GestureDetector(
              child: InkWell(
                child: Container(
                  margin: EdgeInsets.all(9.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.green),
                    borderRadius: BorderRadius.circular(35.0),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(60, 0, 0, 0),
                          blurRadius: 3.0,
                          offset: Offset(3.0, 3.0))
                    ],
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/burger.jpg')),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
              ),
            ),
          ),
        ],
      ),

      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 88,
            child: ImagePick(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom:50,
            child: getgalleryoption(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: bottomNavigationBar,
          ),
        ],
      ),

//      bottomNavigationBar: BottomAppBar(
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          children: <Widget>[
//            IconButton(
//              icon: Icon(Icons.photo_library),
//              onPressed: () => pickImage(ImageSource.gallery),
//            ),
//            IconButton(
//              icon: Icon(Icons.file_upload),
//              onPressed: () => pickImage(ImageSource.gallery),
//            ),
//            IconButton(
//              icon: Icon(Icons.photo_camera),
//              onPressed: () => pickImage(ImageSource.camera),
//            ),
//          ],
//        ),
//      ),

//      body: new Container(
//        alignment: Alignment(0.0, 0.0),
//        child: _image == null
//            ? new Text('No image selected.')
//            : new PhotoFilterSelector(
//          image: _image,
//          filters: presetFiltersList,
//          filename: fileName,
//          loader: Center(child: CircularProgressIndicator()),
//        ),
//      ),
//      body: ListView(
//        children: <Widget>[
//          imageFile == null ? Center(child: Container(margin:EdgeInsets.only(top: height/2),child: Text("No Image Selected"))): Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: Image.file(imageFile),
//          ),
////         _image == null ? Center(child: Container(margin:EdgeInsets.only(top: height/2),child: Text("No Image Selected"))): new PhotoFilterSelector(
////          image: _image,
////          filters: presetFiltersList,
////          filename: fileName,
////          loader: Center(child: CircularProgressIndicator()),
////        ),
//
//          if(imageFile != null)...[
//
////            Image.file(imageFile),
//            Card(
//              clipBehavior: Clip.antiAlias,
//              color: Colors.white70,
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  FlatButton(
//                    child: Icon(Icons.crop),
//                    onPressed: () => cropImage(),
//                  ),
//                  FlatButton(
//                    child: Icon(Icons.edit),
//                    onPressed:()=>cropImage(),
//
//                  ),
//                  FlatButton(
//                    child: Icon(Icons.clear),
//                    onPressed:()=>_clear(),
//                  )
//                ],
//              ),
//            )
//          ]
//        ],
//      ),
    );
  }

  Widget getgalleryoption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.photo_library),
          onPressed: () => pickImage(ImageSource.gallery),
        ),
        IconButton(
          icon: Icon(Icons.file_upload),
          onPressed: () => pickImage(ImageSource.gallery),
        ),
        IconButton(
          icon: Icon(Icons.photo_camera),
          onPressed: () => pickImage(ImageSource.camera),
        ),
      ],
    );
  }

  Widget ImagePick() {
    var height = MediaQuery.of(context).size.height;

    return ListView(
      children: <Widget>[
        imageFile == null
            ? Center(
                child: Container(
                    margin: EdgeInsets.only(top: height / 3),
                    child: Text("No Image Selected")))
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.file(imageFile),
              ),
//         _image == null ? Center(child: Container(margin:EdgeInsets.only(top: height/2),child: Text("No Image Selected"))): new PhotoFilterSelector(
//          image: _image,
//          filters: presetFiltersList,
//          filename: fileName,
//          loader: Center(child: CircularProgressIndicator()),
//        ),

        if (imageFile != null) ...[
//            Image.file(imageFile),
          Card(
            margin: EdgeInsets.only(left:5.0,right: 5.0,top: 0,bottom: 10),
            clipBehavior: Clip.antiAlias,
            color: Colors.white70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Icon(Icons.crop),
                  onPressed: () => cropImage(),
                ),
                FlatButton(
                  child: Icon(Icons.edit),
                  onPressed: () => cropImage(),
                ),
                FlatButton(
                  child: Icon(Icons.clear),
                  onPressed: () => _clear(),
                )
              ],
            ),
          )
        ]
      ],
    );
  }

  Widget get bottomNavigationBar {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40), topLeft: Radius.circular(40)),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 5),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
          child: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: _page,
            height: 58.0,

            items: <Widget>[
              Icon(Icons.home, size: 30),
              Icon(Icons.notifications_active, size: 30),
              Icon(Icons.present_to_all, size: 30),
              Icon(Icons.add_a_photo, size: 30),
              Icon(Icons.search, size: 30),
            ],
            color: Colors.transparent,
            buttonBackgroundColor: Colors.amber,
            backgroundColor: Colors.white,
//            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 600),
            onTap: (index) {
              setState(() {
                _page = index;
                checkClick(_page);
              });
            },
          ),
        ));
  }

  void checkClick(int page) {
    switch (page) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashBoard()),
        );
        break;

      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NotificationCard()),
        );
        break;
      case 2:
        // child = FlutterLogo();
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ImagePickerClass()),
        );
        break;
      case 4:
        //child = FlutterLogo();
        break;
    }
  }
}
