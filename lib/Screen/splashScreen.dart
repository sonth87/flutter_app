import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Consts/consts.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween(begin: 0.0, end: 500.0).animate(_animationController)
      ..addListener(() {
        setState(() {

        });
      })
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          print('Animation Completed');
        } else if (state == AnimationStatus.dismissed) {
          print('Animation Dismissed');
        }
      });

    _animationController.forward();

    startTime();
  }

  startTime() async {
    var _duration = Duration(seconds: 5);
    return Timer(_duration, navigationPage);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
//          child: Center(
////            child: Text(
////              'Wellcome Screen',
////              style: TextStyle(
////                  fontSize: 20,
////                  color: Colors.white,
////                  decoration: TextDecoration.none),
////            ),
          child: Transform.translate(
            offset: Offset(0, _animation.value * 0.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Wellcome Screen',
                  style: TextStyle(
                    fontSize: _animation.value * 0.05,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            )
          ),
//          ),
          color: Colors.transparent,
        )
      ],
    );
  }
}
