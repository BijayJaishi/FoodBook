import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:newflutter/utils/utils.dart';

class Recommended extends StatefulWidget {
  @override
  _RecommendedState createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) =>
          getStaggeredDesign(context, index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 3 : 2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }

  Widget getStaggeredDesign(BuildContext context, int index) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      elevation: 5.0,
      child: new Stack(
        children: <Widget>[
          Positioned(
              bottom: 60,
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      Utils.image(),
                    )),
//            color: Colors.grey,
              )),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 68,
//                color: Colors.green,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              "Caption of Recommended Post Goes Here",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 12),
                            ),
                          )),
                    ),
                    Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left:3.0),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: new Text(
                                      "Halfwaiter Restaurant",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Roboto-Regular"),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:3,bottom: 1.5,top: 1.0),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: new Text("59 minute ago",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300, fontSize: 11
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right:3.0,bottom: 3.0),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      //margin: EdgeInsets.only(left:60.0,bottom: 4.0),
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
                                ),
                              ],

                            ),
                          ],
                        )
                    ),
//                    Expanded(
//
//                      child: Text(
//                        "1 minute ago",
//                        style: TextStyle(
//                            fontWeight: FontWeight.w300, fontSize: 11),
//                      ),
//                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
