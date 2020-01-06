import 'package:newflutter/UI/imageSlider.dart';
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

  final Duration duration = const Duration(milliseconds: 300);
  AnimationController controller;
  Animation<double> scaleTranslation;
  Animation<double> menuScaleTranslation;
  Animation<Offset> _menuanimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: duration);
    scaleTranslation = Tween<double>(begin: 1, end: 0.6).animate(controller);
    menuScaleTranslation =
        Tween<double>(begin: 0.5, end: 1).animate(controller);
    _menuanimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(controller);
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
        title: Text(
          "FoodBook",
          style: TextStyle(
              //fontFamily:
              color: Colors.black),
          textAlign: TextAlign.left,
        ),
        actions: <Widget>[
          AspectRatio(
              aspectRatio: 1 / 1,
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
                          image: AssetImage('assets/images/burger.jpg')
                      ),
                  ),
              ),
          ),

//          IconButton(
//            icon: Icon(
//              Icons.image,
//              color: Colors.black,
//            ),
//            onPressed: () {
//              // do something
//            },
//          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
//          todaysday(context),
//          menu(context),

          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 49,
            child: CarouselDemo(),
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
//          borderRadius: BorderRadius.all(Radius.circular(40)),
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

//      Card(
//      clipBehavior: Clip.antiAlias,
//      color: Colors.transparent,
//      margin: EdgeInsets.all(0.0),
//      elevation: 50.0,
//      shape: RoundedRectangleBorder(
//        borderRadius: BorderRadius.only(
//          topRight: Radius.circular(40),
//          topLeft: Radius.circular(40),
//        ),
//      ),

          child: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: 0,
            height: 55.0,
            items: <Widget>[
              Icon(Icons.notifications_active, size: 30),
              Icon(Icons.list, size: 30),
              Icon(Icons.compare_arrows, size: 30),
              Icon(Icons.call_split, size: 30),
              Icon(Icons.perm_identity, size: 30),
            ],
            color: Colors.white,
            buttonBackgroundColor: Colors.amber,
            backgroundColor: Colors.transparent,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 600),
            onTap: (index) {
              setState(() {
                _page = index;
              });
            },
          ),
        ));
  }

  Widget todaysday(context) {
    return AnimatedPositioned(
      duration: duration,
      top: isCollapsed ? 0 : 0.09 * screenHeight,
      left: isCollapsed ? 0 : 0.2 * screenWidth,
      bottom: isCollapsed ? 0 : -0.16 * screenHeight,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: scaleTranslation,
        child: Material(
          animationDuration: const Duration(),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          elevation: 8,
          child: Container(
            //padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 30.0),
            child: Column(
              children: <Widget>[
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    InkWell(child: Icon(Icons.menu, color: Colors.black),onTap: (){
//                      setState(() {
//                        if(isCollapsed){
//                          controller.forward();
//                        }else{
//                          controller.reverse();
//                        }
//                        isCollapsed = ! isCollapsed;
//                      });
//                    },),
//                    Text("FoodApp",
//                        style: TextStyle(fontSize: 24, color: Colors.black)),
//                    Icon(Icons.search, color: Colors.black),
//                  ],
//                ),
//                SizedBox(height: 10),
                new SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      productsCard(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
//    new SingleChildScrollView(
//      child: Column(
//        mainAxisSize: MainAxisSize.min,
//        children: <Widget>[
//          productsCard(),
//          foodtips(),
//        ],
//      ),
//    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _menuanimation,
      child: ScaleTransition(
        scale: menuScaleTranslation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Dashboard",
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
                SizedBox(height: 10),
                Text(
                  "Messages",
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
                SizedBox(height: 10),
                Text(
                  "About",
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
                SizedBox(height: 10),
                Text(
                  "Share",
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
                SizedBox(height: 10),
                Text(
                  "Branches",
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget productsCard() {
    List<ProductsCollection> productData = []
      ..add(ProductsCollection("assets/images/burger.jpg"))
      ..add(ProductsCollection("assets/images/burger.jpg"))
      ..add(ProductsCollection("assets/images/burger.jpg"))
      ..add(ProductsCollection("assets/images/burger.jpg"))
      ..add(ProductsCollection("assets/images/burger.jpg"))
      ..add(ProductsCollection("assets/images/burger.jpg"))
      ..add(ProductsCollection("assets/images/burger.jpg"))
      ..add(ProductsCollection("assets/images/burger.jpg"))
      ..add(ProductsCollection("assets/images/burger.jpg"));

    return Card(
        child: Container(
      height: 30.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productData.length,
        itemBuilder: (BuildContext context, int i) => new Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/burger.jpg",
                    height: 20.0,
                    width: 20.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class foodtips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 232,
      color: Colors.blueAccent,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(70.0),
            child: Text("Here is your food tips.please read carefully!!"),
          )
        ],
      ),
    );
  }
}

class ProductsCollection {
  final String image;

  ProductsCollection(this.image);
}
