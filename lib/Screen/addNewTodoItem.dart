

import 'package:flutter/material.dart';
import 'package:flutter_app/Models/models.dart';

class AddNewTodoItem extends StatelessWidget {
  final TodoItem item;

  AddNewTodoItem({ this.item });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Add new task'),
      ),
      body: new TextField(
        autofocus: true,
        onSubmitted: (val) {
          Navigator.pop(context, val);
        },
        controller: TextEditingController(
            text: (item != null && item.title != null && item.title.length > 0 ? item.title : '')
        ),
        decoration: new InputDecoration(
          hintText: 'Task name',
          contentPadding: const EdgeInsets.all(16.0)
        ),
      ),
    );
  }
}