import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class GridViewComponent extends StatelessWidget {
  final mynumber;
  final q;

  GridViewComponent({this.mynumber, this.q});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grid view',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new GridViewState(data: mynumber, q: q),
    );

//  new page ( with back button )
//    return Scaffold(
//      body: new GridViewState(data: mynumber, q: q,),
//    );
  }
}

class GridViewState extends StatefulWidget {
  final Object data;
  final String q;

  GridViewState({Key key, this.data, this.q}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new GridItems();
  }
}

class GridItems extends State<GridViewState> {
  List<Widget> _data = [];
  var isLoading = false;
  ScrollController scrollController;
  var page = 1;

  @override
  void initState() {
    super.initState();
    this.fetchImage(widget.data, page);

    // Infinity scroll
    scrollController = ScrollController();
    scrollController.addListener(_scrollListenner);

//    scrollController = new ScrollController()..addListener(_scrollListenner); // other way
  }

  fetchImage(max, page) async {
    var query = widget.q != null && widget.q != ''
        ? widget.q.replaceAll(' ', '+')
        : 'yellow+flowers';
    var key = '15159906-5b41badf8c5ffdcece8f6bbd5';
    var url =
        'https://pixabay.com/api/?key=${key}&q=${query}&image_type=photo&pretty=true&per_page=20&page=${page}';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<Widget> newData = [];
      var _response = json.decode(response.body); // response data

      final max_item = _response['hits'].length < int.tryParse(max)
          ? _response['hits'].length
          : int.tryParse(max);
      var imgs = _response['hits'].sublist(0, max_item); // get list by max item
      for (var i = 0; i < imgs.length; i++) {
        var data_item = imgs[i];

        newData.add(Container(
          alignment: Alignment.center,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.white, width: 1)),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: InkWell(
                  onTap: () {
                    print(data_item);

                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return new AlertDialog(
                            content: new SingleChildScrollView(
                              child: new ListBody(
                                children: <Widget>[
                                  Container(
                                    child: Image.network(
                                        data_item['largeImageURL']),
                                  ),
                                ],
                              ),
                            ),
                            contentPadding: EdgeInsets.all(3),
                          );
                        });
                  },
                  child: Image.network(
                    data_item['webformatURL'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(data_item['userImageURL']),
                    radius: 20.0,
                    backgroundColor: Colors.transparent,
                  ),
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(2.0, 2.0),
                            blurRadius: 5.0)
                      ]),
                ),
                bottom: 5,
                right: 5,
              ),
            ],
          ),
        ));
      }
      setState(() {
        this._data = [..._data, ...newData];
      });
    }
  }

  _drawer() {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('Header'),
            decoration: BoxDecoration(color: Colors.lightBlueAccent),
          ),
          Text('text 1'),
          Text('text 2'),
          Text('text 3'),
        ],
      ),
    );
  }

  _scrollListenner() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      page++;
      this.fetchImage(widget.data, page);
    }
  }

  Future _pullToRefresh() {
    _data = [];
    page = 1;
    return fetchImage(widget.data, page);
  }

  @override
  Widget build(BuildContext context) {
    print('--- rebuild ---');

    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Gridview'),
        ),
        body: RefreshIndicator(
            child: new GridView.count(
              crossAxisCount: 2,
              children: _data,
              controller: scrollController,
            ),
            onRefresh: _pullToRefresh),
        drawer: _drawer());
  }
}
