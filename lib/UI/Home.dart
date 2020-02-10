import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:newflutter/UI/Following.dart';
import 'package:newflutter/UI/Recommended.dart';
import 'package:newflutter/UI/Stories.dart';

import 'Profile.dart';

class Home extends StatefulWidget {
  Home() : super();

  final String title = "Carousel Demo";

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  var post = "50";
  var followers = "500";
  var _tags = "following";
  bool isClicked = false;
  Color storiesColor = Colors.black;
  Color recommendColor = Colors.black;
  Color followColor = Colors.red;

  List imgList = [
    AssetImage("assets/images/burger.jpg"),
    AssetImage("assets/images/newbackground.jpg"),
    AssetImage("assets/images/burger.jpg"),
    AssetImage("assets/images/newbackground.jpg"),
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: gettabs(),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 47,
          bottom: 10,
          child: page(_tags),
        ),
      ],
    );
  }

  Widget gettabs() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: GestureDetector(
            child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text('Following',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        color: followColor,
                      )),
                ),
                onTap: () {
                  setState(() {
                    _tags = "following";
                    storiesColor = Colors.black;
                    recommendColor = Colors.black;
                    followColor = Colors.red;
                  });
                }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child:
              Text('|', style: TextStyle(fontSize: 15.0, color: Colors.black)),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: GestureDetector(
            child: InkWell(
              child: Text('Stories',
                  style: TextStyle(fontSize: 15.0,fontFamily: "Poppins",
                      fontWeight: FontWeight.w500, color: storiesColor)),
              onTap: () {
                setState(() {
                  _tags = "stories";
                  storiesColor = Colors.red;
                  recommendColor = Colors.black;
                  followColor = Colors.black;
                });
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child:
              Text('|', style: TextStyle(fontSize: 15.0, color: Colors.black)),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: GestureDetector(
            child: InkWell(
                child: Text('Recommended',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      color: recommendColor,
                    )),
                onTap: () {
                  setState(() {
                    _tags = "recommended";
                    storiesColor = Colors.black;
                    recommendColor = Colors.red;
                    followColor = Colors.black;
                  });
                }),
          ),
        ),
      ],
    );
  }

  Widget getImages() {
    return Stack(
      children: <Widget>[
        Positioned(
          left: 0,
          right: 0,
          bottom: 27,
          child: stories(),
        ),
//        Positioned(left: 0, right: 0, bottom: 10, child: gethotelprofile())
      ],
    );
  }



  Widget page(String tag) {
    if (tag == "stories") {
      return getImages();
    } else if (tag == "following") {
      return getFollowing();
    } else if (tag == "recommended") {
      return getRecommend();
    } else {
      return getImages();
    }
  }

  Widget getFollowing() {
    return Following();
  }

  Widget getRecommend() {
    return Recommended();
  }
}
