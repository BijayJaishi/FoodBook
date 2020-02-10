import 'package:newflutter/ImagePicker/ImagePicker.dart';
import 'package:newflutter/NotificationCard/notificationCArd.dart';
import 'package:newflutter/UI/Home.dart';
import 'Profile.dart';
import 'curved_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  static final String id = 'dashboard';

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;

  int _page = 0;
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
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;


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
            bottom: 30,
            child: Home(),
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
}
