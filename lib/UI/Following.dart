import 'package:flutter/material.dart';
import 'package:newflutter/PostReact/CommentSection.dart';
import 'package:newflutter/src/read_more_text.dart';
import 'package:newflutter/utils/utils.dart';

class Following extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
                            vertical: 10.0, horizontal: 8.0),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: Image.network(
                                  Utils.image(),
                                  height: 37,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        "Halfwaiter Restaurant",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 3.5, top: 1.0),
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            WidgetSpan(
                                                child: Icon(
                                              Icons.location_on,
                                              size: 14,
                                            )),
                                            TextSpan(
                                              text: "Suryabinayak,Bhaktapur",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11,
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      "1 minute ago",
                                      style: TextStyle(
                                          fontSize: 11, fontFamily: "Poppins"),
                                    ),
                                  ),
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
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 4.0),
                          child: ReadMoreText(
                            'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500),
                            trimLines: 2,
                            colorClickableText: Colors.pink,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: '...Show more',
                            trimExpandedText: ' show less',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 6.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          child: Image.network(
                            Utils.image(isBig: true),
                            fit: BoxFit.cover,
                            height: 250,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8, left: 8, right: 15, bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
//                                SizedBox(
//                                  width: 16,
//                                ),
//                              IconButton(icon: Icon(Icons.favorite_border,color: Colors.black,size: 27.0,), onPressed: null),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    IconTheme(
                                      data: new IconThemeData(
                                          color: Colors.black),
                                      child: new Icon(
                                        Icons.favorite_border,
                                        size: 23,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        "124",
                                        style: TextStyle(fontSize: 14.0),
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    IconTheme(
                                      data: new IconThemeData(
                                          color: Colors.black),
                                      child: InkWell(
                                        child: new Icon(
                                          Icons.insert_comment,
                                          size: 23,
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => CommentSection()),
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        "124",
                                        style: TextStyle(fontSize: 14.0),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    IconTheme(
                                      data: new IconThemeData(
                                          color: Colors.black),
                                      child: new Icon(
                                        Icons.share,
                                        size: 23,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        "124",
                                        style: TextStyle(fontSize: 14.0),
                                      ),
                                    ),
                                  ],
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
      ),
    );
  }
}
