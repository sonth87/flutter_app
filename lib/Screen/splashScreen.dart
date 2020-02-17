import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Consts/consts.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    startTime();
  }

  startTime() async {
    var _duration = Duration(seconds: 5);
    return Timer(_duration, navigationPage);
  }

  navigationPage() {
    Navigator.of(context).pushReplacementNamed(LOGIN_SCREEN);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Positioned(
          child: Image.asset(
            'assets/backgrounds/bg1.png',
            fit: BoxFit.cover,
          ),
          top: 0,
          left: 0,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Container(
          child: Center(
            child: Text(
              'Wellcome Screen',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  decoration: TextDecoration.none),
            ),
          ),
          color: Colors.transparent,
        )
      ],
    );
  }
}
