import 'package:flutter/material.dart';
import 'package:newflutter/src/read_more_text.dart';
import 'package:newflutter/utils/utils.dart';

class CommentSection extends StatefulWidget {
  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,

        iconTheme: IconThemeData(
          color: Colors.black,
          //change your color here
        ),

        title: Align(alignment:Alignment.topRight,child: Text("Comment",style: TextStyle(color: Colors.black),)),
      ),
      body: _buildMainContent(),
    );
  }

  _buildMainContent() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            _buildListItem(),
          ]),
        )
      ],
    );
  }

  Widget _buildListItem() {
    return Wrap(
      children: <Widget>[
         Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0, horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right:3.0),
                    child: Icon(Icons.favorite_border,size: 18,),
                  ),
                  new Text(
                    "Hari Bahadur Shrestha",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                    ),
                    textDirection: TextDirection.ltr,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:3.0),
                    child: new Text(
                      "and 15 others like this Post",
                      style: TextStyle(
                          fontSize: 12.0,
                          fontFamily: "Poppins"
                      ),
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.only(top: 0.0),
              itemBuilder: (context, index) {
                return  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left:10,top:8),
                          child: Container(
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
                        ),
//                          ClipRRect(
//                            borderRadius: BorderRadius.all(
//                              Radius.circular(10),
//                            ),
//                            child: Image.network(
//                              Utils.image(),
//                              height: 43,
//                            ),
//                          ),

                        Padding(
                          padding: const EdgeInsets.only(left:9.2,top: 0,right: 5,bottom: 0),
                          child: FittedBox(
                            fit:BoxFit.scaleDown,
                            child: Text(
                              "Halfwaiter Restaurant",
                              style: TextStyle(
                                  fontSize: 13,fontFamily: "Poppins",
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment:Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right:6.0),
                              child: Text(
                                "1 minute ago",
                                style: TextStyle(fontSize: 11,fontFamily: "Poppins"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left:MediaQuery.of(context).size.width/6,top:0.0),
                      child: ReadMoreText(
                        'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                        style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w500,fontSize: 12),
                        trimLines: 3,
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: '...Show more',
                        trimExpandedText: ' show less',
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    Divider(height: 0,color: Colors.grey,)
                  ],
                );
              },itemCount: 3,
              shrinkWrap: true, // todo comment this out and check the result
              physics: ClampingScrollPhysics(), // todo comment this out and check the result
            ),
          ],
        ),
      ],

    );
  }
}

