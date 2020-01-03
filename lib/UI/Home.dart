import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newflutter/UI/Profile.dart';
import 'DashBoard.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(children: <Widget>[
//        Image.asset(
//          'assets/images/burger.jpg',
//          height: MediaQuery
//              .of(context)
//              .size
//              .height,
//          width: MediaQuery
//              .of(context)
//              .size
//              .width,
//          fit: BoxFit.none,
//        ),
//      Scaffold(
////        appBar: AppBar(
////          title: Text("Home"),
////        ),
//      ),
      Container(
        child: Textfield(),
      ),
    ]);
  }
}

class Textfield extends StatefulWidget {
  @override
  _TextfieldState createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  final TextEditingController textEditingController =
      new TextEditingController();
  String result = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/newbackground.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
//              textDirection: TextDirection.rtl,
              decoration: new InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  prefixIcon: Icon(Icons.perm_identity),
                  hintText: "Half Waiter Id",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 32.0),
                      borderRadius: BorderRadius.circular(25.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 32.0),
                      borderRadius: BorderRadius.circular(25.0))),
              onSubmitted: (String str) {
                setState(() {
                  result = str;
                });
                textEditingController.text = "";
              },
              controller: textEditingController,
            ),
//            new Text(result),
            getButton(),
          ],
        ),
      ),
    );
  }
}

class getButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        new Container(
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        color: Colors.red,
        child: Text(
          "Login",
          style: TextStyle(
            fontSize: 24.0,
//    fontFamily: 'CourierPrime',
//    fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 6.0,
//        onPressed: () => savedata(context),
      onPressed: (){
        Fluttertoast.showToast(
            msg: "Welcome to DashBoard",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
//        showSnackBar(context);
        savedata(context);
      },
      ),
      ),
]);


//    return Container(
//      child: new Align(
//          alignment: Alignment.topRight,
//      child: RaisedButton(
//        shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.all(Radius.circular(20.0))),
//        color: Colors.purple,
//        child: Text(
//          "Login",
//          style: TextStyle(
//            fontSize: 24.0,
////    fontFamily: 'CourierPrime',
////    fontWeight: FontWeight.w700,
//          ),
//        ),
//        elevation: 6.0,
//        onPressed: () => savedata(context),
//      ),
//      ),
//    );
  }
}

void savedata(BuildContext context) {

//  Navigator.push(
//    context,
//    MaterialPageRoute(builder: (context) => DashBoard()),
//  );
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DashBoard()),
  );
//  showSnackBar(context);
}

//SnackBar
void showSnackBar(BuildContext context) {
  final scaffold = Scaffold.of(context);
  var snackBar = SnackBar(
    content: Text('Welcome to DashBoard'),
    action:
        SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
  );
  Scaffold.of(context).showSnackBar(snackBar);
}
