import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
    return Scaffold(
      body: Container(
        child: Wrap(
          children: <Widget>[
            new Column(
//            mainAxisSize: MainAxisSize.max,
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
//                         side: BorderSide(color: Colors.red)
                        ),
                        onPressed: () {},
//                      onPressed: _submit,
                        color: Colors.black,
//                      padding: EdgeInsets.all(10.0),
                        child: Text('Stories',
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.white)),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
//                          side: BorderSide(color: Colors.red)
                        ),
                        onPressed: () {},
//                      onPressed: _submit,
                        color: Colors.blueGrey[100],
//                      padding: EdgeInsets.all(10.0),
                        child: Text('Recommended',
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.black)),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
//                        decoration: BoxDecoration(
//                          boxShadow: [
//                            BoxShadow(
//                              color: Colors.grey.withOpacity(0.8),
////                              spreadRadius: 10,
//                              blurRadius: 5,
//                              offset: Offset(0.5, 0.5), // changes position of shadow
//                            ),
//                          ],
//                        ),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),

//                          side: BorderSide(width : 3,color: Colors.black12)
                          ),
                          onPressed: () {},
//                      onPressed: _submit,
                          color: Colors.blueGrey[100],
//                      padding: EdgeInsets.all(10.0),
                          child: Text('Following',
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black)),
                        ),
                      ),
                    ),

//                  OutlineButton(
//                    onPressed: goToPrevious,
//                    child: Text("<"),
//                  ),
//                  OutlineButton(
//                    onPressed: goToNext,
//                    child: Text(">"),
//                  ),
                  ],
                ),

                carouselSlider = CarouselSlider(
                  height: MediaQuery.of(context).size.height / 1.5,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  autoPlay: false,
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
                              borderRadius: BorderRadius.circular(35.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(80, 0, 0, 0),
                                    blurRadius: 5.0,
                                    offset: Offset(5.0, 5.0))
                              ],
                              image: DecorationImage(
                                  fit: BoxFit.cover, image: imgUrl)),
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                              margin: EdgeInsets.only(bottom: 10.0,right: 20.0),
                              alignment: Alignment.bottomRight,
                              child :Icon(Icons.favorite,color: Colors.redAccent,),
                            ),


//                          child: new Text('Title',
//                              style: new TextStyle(
//                                fontWeight: FontWeight.bold,
//                                color: Colors.red,
//                                fontSize: 20.0,
//                              )
//                          ),
//                        margin: EdgeInsets.symmetric(horizontal: 10.0),
//                        decoration: BoxDecoration(
////                          color: Colors.green,
//                        ),
//                        child: Image(
//                          height: double.infinity,
//                          width: double.infinity,
//                          fit: BoxFit.cover,
//                          image : imgUrl
//
////                          Image.asset(
////                            imgUrl,
////                            fit: BoxFit.fill,
////                          ),
//                        )
                        );
//                        );
                      },
                    );
                  }).toList(),
                ),
              Center(
                child : Container(
                  margin: EdgeInsets.only(top: 7),
                  child : Row(
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
                            "HalfWaiter Restaurant",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold
                            ),
                            textDirection: TextDirection.ltr,
                          ),
                          new Text("$post Posts  |  $followers Followers",style: TextStyle(
                            fontSize: 14.0,
                          )),
                        ],
                      ),

                    ],
                  ),
                ),

              )

              ],
            ),
          ],
        ),
      ),
    );
  }

//  goToPrevious() {
//    carouselSlider.previousPage(
//        duration: Duration(milliseconds: 300), curve: Curves.ease);
//  }
//
//  goToNext() {
//    carouselSlider.nextPage(
//        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
//  }
}
