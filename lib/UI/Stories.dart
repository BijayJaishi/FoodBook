import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'Profile.dart';

class stories extends StatefulWidget {
  @override
  _storiesState createState() => _storiesState();
}

class _storiesState extends State<stories> {
  CarouselSlider carouselSlider;
  int _current = 0;
  var post = "50";
  var followers = "500";
  bool isClicked = false;
  Color storiesColor = Colors.red;
  Color recommendColor = Colors.black;
  Color followColor = Colors.black;

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
    return getStories();
  }

  Widget getStories(){
    return CarouselSlider(
      height: MediaQuery.of(context).size.height - 200,
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
            return Stack(
//              mainAxisSize: MainAxisSize.max,
              children: <Widget>[

                Positioned (
                  top: 0,
                  bottom: 55,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300,
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
                        image:
                        DecorationImage(fit: BoxFit.cover, image: imgUrl)),
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10.0, right: 20.0),
                      alignment: Alignment.bottomRight,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ),

                Positioned (
//                  top: 50,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: gethotelprofile()   ),

              ],
            );
          },
        );
      }).toList(),
    );
  }

  Widget gethotelprofile() {
    return Center(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: GestureDetector(
                child: InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 10.0),
                    height: 43,
                    width: 43,
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
            new Column(
              children: <Widget>[
                GestureDetector(
                  child: InkWell(
                    child: new Text(
                      "Halfwaiter Restaurant",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,),
                      textDirection: TextDirection.ltr,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profile()),
                      );
                    },
                  ),
                ),
                new Text("$post Posts  |  $followers Followers",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
