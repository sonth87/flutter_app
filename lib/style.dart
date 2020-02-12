
import 'package:flutter/material.dart';

class Style {
  navBarStyle(label, img) {
    return new BottomNavigationBarItem(
      icon: Image.asset(
        img,
        width: 20,
        height: 20,
        color: Color.fromRGBO(255, 255, 255, 0.3),
        colorBlendMode: BlendMode.modulate,
      ),
      title: Container(
        margin: EdgeInsets.only(top: 2.0),
        child: Text(label),
      ),
    );
  }
}