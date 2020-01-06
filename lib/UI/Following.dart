import 'package:flutter/material.dart';
import 'package:newflutter/utils/utils.dart';

class Following extends StatelessWidget {
  //static final String id = 'Followingscreen';
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
      ),
    );
  }
}
