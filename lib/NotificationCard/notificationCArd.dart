import 'package:flutter/material.dart';
import 'package:newflutter/ImagePicker/ImagePicker.dart';
import 'package:newflutter/UI/DashBoard.dart';
import 'package:newflutter/UI/Profile.dart';
import 'package:newflutter/UI/curved_navigation.dart';
class NotificationCard extends StatefulWidget {
  @override
  _NotificationCardState createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> with SingleTickerProviderStateMixin {

  bool isCollapsed = true;
  double screenWidth, screenHeight;

  int _page = 1;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Image.asset('assets/images/logo.png',height: 30,),
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
              child: gettabs()),
            Positioned(
              left: 0,
              right: 0,
              top: 41,
              bottom: 55,
              child: Center(child: SwipeList()),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: bottomNavigationBar,
            ),
          ],
        ),

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

    switch(page) {
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

  Widget gettabs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Text('Notifications',
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w700,
              )),
        ),
//        Padding(
//          padding: const EdgeInsets.all(8.0),
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Text('Today',
//                  style: TextStyle(
//                    fontSize: 16.0,
//                    fontFamily: "Poppins",
//                    color: Colors.black54,
//                    fontWeight: FontWeight.w500,
//                  )),
//              Icon(Icons.menu,color: Colors.black54,),
//            ],
//          ),
//        ),
      ],
    );
  }
}

class SwipeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListItemWidget();
  }
}

class ListItemWidget extends State<SwipeList> {

  @override
  Widget build(BuildContext context) {
    return _buildMainContent();
  }

  _buildMainContent() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            _buildListItem(),
            _buildListItem(),
          ]),
        )
      ],
    );
  }

  Widget _buildListItem() {
    return Column(
      children: <Widget>[
    Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Today',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "Poppins",
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  )),
              Icon(Icons.menu,color: Colors.black54,),
            ],
          ),
        ),
    ListView.builder(
          itemBuilder: (context, index) {
            return Card(
                elevation: 5,
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                       Padding(
                         padding: const EdgeInsets.only(top:8.0,left: 8.0,bottom: 8.0),
                         child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(right: 8.0),
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
//                      Container(
//                        height: 100,
//                        child: Padding(
//                          padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
//                          child: Column(
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
////                              Text(
////                                items[index],
////
////                              ),
//
//                              Padding(
//                                padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
//                                child: Container(
//
//                                  child: Text("K and K Tech Private Limeted Liked Your Post",style: TextStyle(
//                                      fontSize: 13,
//                                      color: Color.fromARGB(255, 48, 48, 54)
//                                  ),),
//                                ),
//
//                              ),
//                              Padding(
//                                padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
//                                child: Container(
////                                  decoration: BoxDecoration(
////                                      border: Border.all(color: Colors.teal),
////                                      borderRadius: BorderRadius.all(Radius.circular(5))
////                                  ),
//                                  child: Text("5 minutes ago"),
//                                ),
//                              ),
//                            ],
//                          ),
//                        ),
//                      )
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                                "Halfwaiter Restaurant",
                                style: TextStyle(
                                    fontSize: 11.0,
                                    fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                ),
                                textDirection: TextDirection.ltr,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:3.0),
                                child: new Text(
                                  "liked your Post",
                                  style: TextStyle(
                                      fontSize: 11.0,
                                      fontFamily: "Poppins"
                                  ),
                                  textDirection: TextDirection.ltr,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new Text("5 Min ago",
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w400,
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(left:5.0),
                                child: new Icon(Icons.thumb_up,size: 14,
                                  color: Colors.black54,),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 70.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  topLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                              topRight: Radius.circular(5)
                              ),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage("https://is2-ssl.mzstatic.com/image/thumb/Video2/v4/e1/69/8b/e1698bc0-c23d-2424-40b7-527864c94a8e/pr_source.lsr/268x0w.png")
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
          },itemCount: 5,
          shrinkWrap: true, // todo comment this out and check the result
          physics: ClampingScrollPhysics(), // todo comment this out and check the result
        ),
      ],
    );
  }
}

//  @override
//  Widget build(BuildContext context) {
//    return Container(
//        child: ListView.builder(
//          itemCount: items.length,
//          itemBuilder: (context, index) {
//            return Dismissible(
//              key: Key(items[index]),
//              background: Container(
//                alignment: AlignmentDirectional.centerEnd,
//                color: Colors.red,
//                child: Icon(
//                  Icons.delete,
//                  color: Colors.white,
//                ),
//              ),
//              onDismissed: (direction) {
//                setState(() {
//                  items.removeAt(index);
//                });
//              },
//              direction: DismissDirection.endToStart,
//              child: Card(
//                elevation: 5,
//                child: Container(
//                  width: double.infinity,
//                  height: 60.0,
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.only(top:8.0,left: 8.0,bottom: 8.0),
//                         child: Container(
//                          alignment: Alignment.center,
//                          margin: EdgeInsets.only(right: 8.0),
//                          height: 43,
//                          width: 43,
//                          decoration: BoxDecoration(
//                            border: Border.all(width: 2.0, color: Colors.green),
//                            borderRadius: BorderRadius.circular(35.0),
//                            boxShadow: [
//                              BoxShadow(
//                                  color: Color.fromARGB(60, 0, 0, 0),
//                                  blurRadius: 3.0,
//                                  offset: Offset(3.0, 3.0))
//                            ],
//                            image: DecorationImage(
//                                fit: BoxFit.cover,
//                                image: AssetImage('assets/images/burger.jpg')),
//                          ),
//                      ),
//                       ),
////                      Container(
////                        height: 100,
////                        child: Padding(
////                          padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
////                          child: Column(
////                            crossAxisAlignment: CrossAxisAlignment.start,
////                            children: <Widget>[
//////                              Text(
//////                                items[index],
//////
//////                              ),
////
////                              Padding(
////                                padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
////                                child: Container(
////
////                                  child: Text("K and K Tech Private Limeted Liked Your Post",style: TextStyle(
////                                      fontSize: 13,
////                                      color: Color.fromARGB(255, 48, 48, 54)
////                                  ),),
////                                ),
////
////                              ),
////                              Padding(
////                                padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
////                                child: Container(
//////                                  decoration: BoxDecoration(
//////                                      border: Border.all(color: Colors.teal),
//////                                      borderRadius: BorderRadius.all(Radius.circular(5))
//////                                  ),
////                                  child: Text("5 minutes ago"),
////                                ),
////                              ),
////                            ],
////                          ),
////                        ),
////                      )
//                      new Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.start,
//                            children: <Widget>[
//                              new Text(
//                                "Halfwaiter Restaurant",
//                                style: TextStyle(
//                                    fontSize: 11.0,
//                                    fontFamily: "Poppins",
//                                  fontWeight: FontWeight.bold,
//                                ),
//                                textDirection: TextDirection.ltr,
//                              ),
//                              Padding(
//                                padding: const EdgeInsets.only(left:3.0),
//                                child: new Text(
//                                  "liked your Post",
//                                  style: TextStyle(
//                                      fontSize: 11.0,
//                                      fontFamily: "Poppins"
//                                  ),
//                                  textDirection: TextDirection.ltr,
//                                ),
//                              ),
//                            ],
//                          ),
//
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.start,
//                            children: <Widget>[
//                              new Text("5 Min ago",
//                                  style: TextStyle(
//                                    fontSize: 10.0,
//                                    fontFamily: "Poppins",
//                                    fontWeight: FontWeight.w400,
//                                  )),
//                              Padding(
//                                padding: const EdgeInsets.only(left:5.0),
//                                child: new Icon(Icons.thumb_up,size: 14,
//                                  color: Colors.black54,),
//                              ),
//                            ],
//                          ),
//                        ],
//                      ),
//                      Padding(
//                        padding: const EdgeInsets.all(8.0),
//                        child: Container(
//                          height: 70.0,
//                          width: 70.0,
//                          decoration: BoxDecoration(
//                              borderRadius: BorderRadius.only(
//                                  bottomLeft: Radius.circular(5),
//                                  topLeft: Radius.circular(5),
//                                  bottomRight: Radius.circular(5),
//                              topRight: Radius.circular(5)
//                              ),
//                              image: DecorationImage(
//                                  fit: BoxFit.cover,
//                                  image: NetworkImage("https://is2-ssl.mzstatic.com/image/thumb/Video2/v4/e1/69/8b/e1698bc0-c23d-2424-40b7-527864c94a8e/pr_source.lsr/268x0w.png")
//                              )
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//            );
//          },
//        ));
//  }
//
//  static List getDummyList() {
//    List list = List.generate(10, (i) {
//      return "Item ${i + 1}";
//    });
//    return list;
//  }
//}