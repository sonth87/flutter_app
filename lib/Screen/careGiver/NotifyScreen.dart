
import 'package:flutter/material.dart';

class NotifyScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NotifyScreenState();
  }
}

class _NotifyScreenState extends State<NotifyScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text('Notify Screen', style: TextStyle(fontSize: 20, color: Colors.white),),
      ),
    );
  }
}