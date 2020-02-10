import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newflutter/UI/DashBoard.dart';

class Loginpage extends StatefulWidget {
  static final String id = 'loginscreen';

  @override
  LoginpageState createState() => LoginpageState();
}

class LoginpageState extends State<Loginpage> {
  final formkey = GlobalKey<FormState>();
  String _email, _password;

  _submit() {
    if (formkey.currentState.validate()) {
      formkey.currentState.save();
      print(_email);
      print(_password);
      Navigator.pushNamed(context, DashBoard.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: loginform(),
      ),
    );
  }

  Widget loginform() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/images/logo.png',
          height: 42,
        ),
        Form(
          key: formkey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (input) =>
                      !input.contains('@') ? 'Please enter valid email' : null,
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (input) => _email = input,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  validator: (input) =>
                      input.length < 6 ? 'Must be atleast 6 character' : null,
                  onSaved: (input) => _password = input,
                  obscureText: true,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                  width: 250.0,
//                child: FlatButton(
//                  onPressed: _submit,
//                  color: Colors.blue,
//                  padding: EdgeInsets.all(10.0),
//                  child: Text('Login',
//                      style:
//                      TextStyle(fontSize: 18.0, color: Colors.white)),
//                ),
                  child: new MaterialButton(
                    height: 50.0,
                    minWidth: 150.0,
                    color: Colors.green,
                    splashColor: Colors.teal,
                    textColor: Colors.white,
                    child: new Icon(FontAwesomeIcons.signInAlt),
                    onPressed: _submit,
                  )),
            ],
          ),
        )
      ],
    );
  }
}
