import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/Consts/consts.dart';
import 'package:flutter_app/Models/models.dart';
import 'package:flutter_app/Screen/signUpScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final LoginModel login;

  LoginScreenState({this.login});

  final TextEditingController username = new TextEditingController();
  final TextEditingController password = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  submitForm() async {
//    await Timer(Duration(seconds: 5), () {  // waitting for response
//      print('response login');
      if (username.value.text.length > 0 && password.value.text.length > 0) {
//        Navigator.of(context).pushReplacementNamed(HOME_SCREEN);

          Navigator.of(context).pushNamed(OTP_SCREEN);
      } else {
//        username.
      }
//    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            color: Colors.white,
          ),
        ),
        Positioned(
          child: Container(
//            width: 400,
//            height: 400,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.circular(600.0)
            ),
          ),
          height: 600,
          width: 600,
          left: -350,
          top: -200,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(50.0),
                      child: Image.asset(
                        'assets/images/bank.png',
                        width: 150,
                        height: 150,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'User Name',
                              icon: Icon(Icons.people)
                            ),
                            onSubmitted: (val) {
                              submitForm();
                            },
                            controller: username,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Password',
                              icon: Icon(Icons.vpn_key)
                            ),
                            obscureText: true,
                            onSubmitted: (val) {
                              submitForm();
                            },
                            controller: password,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: InkWell(
                              child: Text('Đăng ký'),
                              onTap: () {
//                        Navigator.of(context)
//                            .pushNamed(SIGN_UP_SCREEN);
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen(), fullscreenDialog: true)); // Fullscreen Dialog
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        )
      ],
    );
  }
}
