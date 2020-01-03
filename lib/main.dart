import 'package:flutter/material.dart';
import 'package:newflutter/UI/DashBoard.dart';
import 'package:newflutter/UI/LoginPage.dart';
import 'UI/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:loginpage(),
        routes: {
          loginpage.id:(context)=>loginpage(),

          DashBoard.id : (context)=>DashBoard(),
    },
    );
  }
}
