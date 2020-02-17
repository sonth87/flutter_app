
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng ký'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        child: Center(
          child: Text('Đăng ký'),
        ),
      ),
    );
  }
}