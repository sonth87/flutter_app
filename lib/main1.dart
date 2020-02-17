import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/Screen/gridViewComponent.dart';
import 'package:flutter_app/Screen/listViewComponent.dart';
import 'package:flutter_app/myDrawer.dart';
import 'package:flutter_app/Screen/todoList.dart';

class MyApp1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My demo app',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: new MyHomePage(appTitle: 'ahihi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.appTitle}) : super(key: key);

  final String appTitle;

  @override
  createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  var wellcometext = '100';

  getTitle() {
    return widget.appTitle;
  }

  setTitle(String new_title) {
    setState(() {
      wellcometext = new_title;
    });
  }

  getRandom() {
    var r = new Random();
    var a = r.nextInt(100);
    return a.toString();
  }

  goToListView(mynumber) {
    print(mynumber);

    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (BuildContext context) =>
            ListViewComponent(view_number: mynumber)));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      drawer: MyDrawer(),
      appBar: new AppBar(
        title: new Text(getTitle()),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TodoList()));
              })
        ],
      ),
      body: SafeArea(
        child: new Column(
          children: <Widget>[
            Container(
              child: new FlatButton(
                onPressed: () {
                  this.goToListView(wellcometext);
                },
                color: Colors.green,
                child: new Text(
                  '👀💩🥴😵 $wellcometext',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            Container(
              child: new FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GridViewComponent(
                                mynumber: this.wellcometext,
                              )));
                },
                color: Colors.green,
                child: new Text(
                  '$wellcometext',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  TextField(
                    onSubmitted: (value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GridViewComponent(
                                  mynumber: this.wellcometext, q: value)));
                    },
                    style: TextStyle(
//                    backgroundColor: Colors.white,
                        ),
                    decoration: InputDecoration(
                        hintText: 'Search Image',
                        border: OutlineInputBorder(),
                        fillColor: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          setTitle(getRandom());
        },
        child: new Icon(Icons.replay),
      ),
    );
  }
}
