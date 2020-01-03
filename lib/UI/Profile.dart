import 'package:flutter/material.dart';

class Profile extends StatefulWidget {

//  const Profile({Key key, this.controller}) : super(key: key);
//  final PageController controller;
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>  with SingleTickerProviderStateMixin {

  bool isCollapsed = true;
  double screenWidth,screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController controller;
  Animation<double> scaleTranslation;
  Animation<double> menuScaleTranslation;
  Animation<Offset> _menuanimation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: duration);
    scaleTranslation = Tween<double>(begin: 1,end: 0.6).animate(controller);
//    menuScaleTranslation = Tween<double>(begin: 0,end: 1).animate(controller);
    _menuanimation = Tween<Offset>(begin:Offset(-1,0) ,end:Offset(0,0) ).animate(controller);
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
        elevation: 2.0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: Text("FoodApp",style: TextStyle(color: Colors.black))
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: IconButton(icon:Icon(Icons.search,color: Colors.black)),
          ),
        ],
        leading: GestureDetector(
          onTap: () {
//            widget.controller.animateToPage(
//              0,
//              duration: Duration(milliseconds: 500),
//              curve: Curves.ease,
//            );
          },
          child: Padding(
            padding: EdgeInsets.all(10),
            child: IconButton(icon:Icon(Icons.menu,color: Colors.black)),
          ),
        ),
      ),
        body: Stack(
          children: <Widget>[
            menu(context),
            todaysday(context),
          ],
        ),
//      body: CustomScrollView(
//        slivers: <Widget>[
//          SliverToBoxAdapter(
//            child: Container(
//              height: 120,
//              decoration: BoxDecoration(
//                border: Border(
//                  bottom: BorderSide(
//                    width: 1.0,
//                    color: Color(0xFFF0F0F0),
//                  ),
//                ),
//              ),
////              child: StoriesListView(),
//            child: productsCard(),
//            ),
//          ),
////          MainHomeList()
//        ],
//      ),
    );
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
              productsCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget menu(context) {
    return SlideTransition(
      position: _menuanimation,
//      child: ScaleTransition(
//        scale: menuScaleTranslation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0,top: 16.0),
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
//      ),
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
          height: 80.0,
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
                        height: 70.0,
                        width: 70.0,
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

class ProductsCollection {
  final String image;

  ProductsCollection(this.image);
}