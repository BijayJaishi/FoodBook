import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:newflutter/UI/Following.dart';
import 'package:newflutter/UI/recommended.dart';
import 'package:newflutter/utils/utils.dart';

class CarouselDemo extends StatefulWidget {
  CarouselDemo() : super();

  final String title = "Carousel Demo";

  @override
  CarouselDemoState createState() => CarouselDemoState();
}

class CarouselDemoState extends State<CarouselDemo> {
  CarouselSlider carouselSlider;
  int _current = 0;
  var post = "50";
  var followers = "500";
  var _tags = "stories";
  bool isClicked = false;

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
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: GestureDetector(
                  child: InkWell(
                    child: Text('Stories',
                        style: TextStyle(fontSize: 15.0, color: Colors.red)),
                    onTap: () {
                      setState(() {
                        _tags = "stories";
                      });
                    },
                  ),
                ),
                //),
              ),

              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text('|',
                    style: TextStyle(fontSize: 15.0, color: Colors.black)),
              ),

              Padding(
                padding: const EdgeInsets.all(6.0),
                child: GestureDetector(
                  child: InkWell(
                      child: Text('Recommended',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                          )),
                      onTap: () {
                        setState(() {
                          _tags = "recommended";
                        });
//                          getFollowing();
                        //Navigator.pushNamed(context, Following.id);
                      }),
                ),
//                      ),
              ),

              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text('|',
                    style: TextStyle(fontSize: 15.0, color: Colors.black)),
              ),
//
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: GestureDetector(
                  child: InkWell(
                      child: Text('Following',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                          )),
                      onTap: () {
                        setState(() {
                          _tags = "following";
                        });
//                          getFollowing();
                        //Navigator.pushNamed(context, Following.id);
                      }),
                ),
              ),
            ],
          ),
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

  Widget getImages() {
//    print("I am here");

      return Stack(
        children: <Widget>[

          Positioned(
            left: 0,
            right: 0,
            bottom: 55,
            child: CarouselSlider(
              height: MediaQuery.of(context).size.height - 230,
              initialPage: 0,
              enlargeCenterPage: true,
              autoPlay: true,
              reverse: false,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 2),
              autoPlayAnimationDuration: Duration(milliseconds: 2000),
              pauseAutoPlayOnTouch: Duration(seconds: 7),
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              items: imgList.map((imgUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      margin: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
//                              border: Border.all(width : 10.0,color: Colors.transparent),
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(80, 0, 0, 0),
                                blurRadius: 5.0,
                                offset: Offset(5.0, 5.0))
                          ],
                          image: DecorationImage(
                              fit: BoxFit.cover, image: imgUrl)),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10.0, right: 20.0),
                        alignment: Alignment.bottomRight,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: Center(
                child: Container(
//                  margin: EdgeInsets.only(top: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(right: 10.0),
                          height: 43,
                          width: 43,
                          //margin: EdgeInsets.only(left:100.0),
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
                      ),
                      new Column(
                        children: <Widget>[
                          new Text(
                            "Halfwaiter Restaurant",
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Roboto-Regular"),
                            textDirection: TextDirection.ltr,
                          ),
                          new Text("$post Posts  |  $followers Followers",
                              style: TextStyle(
                                fontSize: 14.0,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
//
              ))
        ],

      );

  }

  Widget page(String tag) {
    if (tag == "stories") {
      return getImages();
    } else if (tag == "following") {
      return getFollowing();
    }else if(tag == "recommended"){
      return getRecommend();
    }else {
      return getImages();
    }
  }

  Widget getFollowing() {

    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return Container(
                padding: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFF0F0F0),
                    ),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15),
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            child: Image.network(
                              Utils.image(),
                              height: 33,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              "This is your friend!",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Image.asset(
                            "more.png",
                            fit: BoxFit.contain,
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    Image.network(
                      Utils.image(isBig: true),
                      fit: BoxFit.cover,
                      height: 350,
                      width: double.infinity,
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: 15, left: 15, right: 20, bottom: 10),
                          child: Row(
                            children: <Widget>[
//                          Image.asset(
//                            "heart.png",
//                            height: 27,
//                          ),
                              SizedBox(
                                width: 13,
                              ),
                              Image.asset(
                                "comment.png",
                                height: 27,
                              ),
                              SizedBox(
                                width: 13,
                              ),
                              Image.asset(
                                "direct.png",
                                width: 27,
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Image.asset(
                                    "save.png",
                                    height: 27,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    "1.000 likes",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 7),
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: "Gabriele Cicconetti ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                          "Hi everyone thank you for watching :))",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 15),
                                  child: Text(
                                    "See other 25 comments",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Utils.getProfileImage(),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    "Add a comment...",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "17 minutes ago",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            childCount: 100,
          ),
        ),
      ],
    );
  }

  Widget getRecommend(){
    return Recommended();
  }
}
