import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newflutter/UI/DashBoard.dart';
import 'package:newflutter/UI/LoginPage.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodbook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Loginpage(),
      routes: {
        Loginpage.id: (context) => Loginpage(),
        DashBoard.id: (context) => DashBoard(),
      },
    );
  }


}
