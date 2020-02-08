import 'package:flutter/material.dart';
import 'package:flutter_app/gridViewComponent.dart';
import 'package:flutter_app/main1.dart';
import 'package:flutter_app/todoList.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: FlatButton(
              child: Text('My first flutter app',
                  style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp1()));
              },
            ),
            decoration: BoxDecoration(color: Colors.deepPurpleAccent),
          ),
          ListTile(
              title: Text('Todo app'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => TodoList()));
              }),
          ListTile(
            title: Text('Photos'),
            onTap: () {
              Navigator.pop(
                  context); // Ẩn drawer trước khi chuyển trang ( để back lại ko hiện drawer )
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GridViewComponent(
                            mynumber: '100',
                            q: 'sexy',
                          )));
            },
          ),
        ],
      ),
    );
  }
}
