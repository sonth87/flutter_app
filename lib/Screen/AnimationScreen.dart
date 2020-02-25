import 'package:flutter/material.dart';

// https://uxdesign.cc/level-up-flutter-page-transition-choreographing-animations-across-screens-efb5ea105fca
class AnimationScreen extends StatefulWidget {
  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with TickerProviderStateMixin {

  List dataList;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      drawer: _drawer(),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: 1.0,
            backgroundColor: Colors.transparent,
            pinned: true,
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                child: Text(
                  'Vietnam',
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            leading: Icon(
              Icons.sort,
              color: Colors.black87,
            ),
            actions: <Widget>[
              Visibility(
                visible: true,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: InkWell(
                    child: Icon(
                      Icons.share,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: true,
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: InkWell(
                    child: Icon(Icons.search, color: Colors.black87),
                  ),
                ),
              ),
            ],
          ),
          SliverFillRemaining(
            child: Container(

            ),
          )
        ],
      ),
    );
  }

  Widget _appBar() {
    return null;
  }

  Widget _drawer() {}
}
