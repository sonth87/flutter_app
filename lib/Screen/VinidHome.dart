import 'package:flutter/material.dart';

import '../myDrawer.dart';

class VinidHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VinidHomeState();
  }
}

class VinidHomeState extends State<VinidHome> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: Image.asset(
              'assets/images/banner3.png',
              fit: BoxFit.cover,
            ),
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            child: new AppBar(
              leading: BackButton(),
              actions: <Widget>[
                FlatButton(
                  child: Icon(Icons.notifications_none, color: Colors.white,),
                  onPressed: () {},
                )
              ],
              backgroundColor: Colors.transparent,
              elevation: 1,
            ),
          ),
          Card(
              elevation: 20.0,
              margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 170.0),
              child: ListView(
                  padding: EdgeInsets.only(
                      top: 20.0, left: 20.0, right: 18.0, bottom: 5.0),
                  children: <Widget>[TextField(), TextField()])),
          Padding(
            padding: EdgeInsets.only(top: 100),
          )
        ],
      ),
    );
  }
}
