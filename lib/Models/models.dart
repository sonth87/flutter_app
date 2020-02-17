

import 'package:flutter/material.dart';

class TodoItem {
  final String key;
  final String title;
  final String description;
  final completed;

  TodoItem({
    this.key,
    this.title,
    this.description,
    this.completed
  });
}

class GridModel {
  String _imagePath;
  String _title;
  Color _color;
  Function callBack;

  GridModel(this._imagePath, this._title, this._color, this.callBack);

  Color get color => _color;
  String get title => _title;
  String get imagePath => _imagePath;
}

class LoginModel {
  String username;
  String password;

  LoginModel(this.username, this.password);
}