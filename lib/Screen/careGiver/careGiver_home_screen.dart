import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Consts/consts.dart';
import 'package:flutter_app/Screen/careGiver/HomeScreen.dart';
import 'package:flutter_app/Screen/careGiver/NotifyScreen.dart';

class CareGiverHomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CareGiverHomeScreenState();
  }
}

class _CareGiverHomeScreenState extends State<CareGiverHomeScreen> {
  double _height;
  double _width;
  int _currentIndex = 0;

  final List<Widget> _listScreen = [
    HomeScreen(),
    NotifyScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return WillPopScope(
      child: Scaffold(
        appBar: _appBar(),
        body: _body(),
        bottomNavigationBar: CurvedNavigationBar(
          index: 0,
          height: 50.0,
          items: <Widget>[
            Icon(
              Icons.home,
              size: 25,
              color: Colors.white,
            ),
            Icon(
              Icons.notifications,
              size: 25,
              color: Colors.white,
            ),
            Icon(
              Icons.add,
              size: 25,
              color: Colors.white,
            ),
            Icon(
              Icons.person,
              size: 25,
              color: Colors.white,
            ),
            Icon(
              Icons.settings,
              size: 25,
              color: Colors.white,
            ),
          ],
          color: Colors.deepPurpleAccent,
          buttonBackgroundColor: Colors.orange,
          backgroundColor: Colors.blue,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 500),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),

      // Click back on android
      onWillPop: () {print('click back button'); // Bắt sự kiện back trên android ( đang chưa hoạt động )
        return new Future(() => Navigator.of(context).pushReplacementNamed(HOME_SCREEN));
      },
    );
  }

  _body() {
    return _listScreen[_currentIndex];
  }

  _appBar() {}
}
