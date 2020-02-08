import 'package:flutter/material.dart';

// https://github.com/flutter-devs/flutter_paytm_clone/blob/master/lib/ui/paytm.dart

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Home screen',
      home: new _HomeScreen(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class _HomeScreen extends StatefulWidget {
//  _HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: _bottomTab(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _appBar() {
    return new AppBar(
      title: Row(
        children: <Widget>[],
        mainAxisSize: MainAxisSize.max,
      ),
      backgroundColor: Colors.lightBlue,
    );
  }

  Widget _body() {
    return new Container();
  }

  Widget _bottomTab() {
    return new BottomNavigationBar(
      items: [
        new BottomNavigationBarItem(
          icon: Image.asset(
            'assets/images/home.png',
            width: 20,
            height: 20,
            color: Color.fromRGBO(255, 255, 255, 0.3),
            colorBlendMode: BlendMode.modulate,
          ),
          title: Container(
            margin: EdgeInsets.only(top: 2.0),
            child: Text('Home'),
          ),
        ),
        new BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/shopping-bagg.png',
              width: 20,
              height: 20,
              color: Color.fromRGBO(255, 255, 255, 0.3),
              colorBlendMode: BlendMode.modulate,
            ),
            title: Container(
              margin: EdgeInsets.only(top: 2.0),
              child: Text('Mall'),
            ))
      ],
    );
  }
}
