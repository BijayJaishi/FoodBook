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
      itemCount: 10,
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
              bottom: 50,
              top: 0,
              right: 0,
              left: 0,
              child: Container(

                child: Image(
                    fit: BoxFit.cover, image: NetworkImage( Utils.image(),)),
//            color: Colors.grey,
              )),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(

                height: 50,
//                color: Colors.green,
                child: Column(
                  children: <Widget>[
                    Expanded(

                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Padding(
                            padding: const EdgeInsets.all(2.5),
                            child: Text(
                              "Roshan Posakya",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                    Expanded(

                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Half Waiter Software",
                            style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13),
                          )),
                    ),
                    Expanded(

                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "20 Post | 200 Followers",
                            style: TextStyle(fontWeight: FontWeight.w300,fontSize: 11),
                          )),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}