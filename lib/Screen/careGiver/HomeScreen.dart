import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/myDrawer.dart';

class HomeScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> sKey;

  HomeScreen({this.sKey});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _tab_active = 0;
  double _height;
  double _width;

  AnimationController _controller1, _controller2, _controller3, _controller4;
  Animation _animation1, _animation2, _animation3, _animation4;

  @override
  void initState() {
    _controller1 = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);
    _controller2 =
        AnimationController(duration: Duration(milliseconds: 700), vsync: this);
    _controller3 =
        AnimationController(duration: Duration(milliseconds: 700), vsync: this);
    _controller4 =
        AnimationController(duration: Duration(milliseconds: 700), vsync: this);

    _animation1 = Tween(begin: Offset(-1, 0), end: Offset(0, 0)).animate(
        CurvedAnimation(parent: _controller1, curve: Curves.easeInOut));
    _animation2 = Tween(begin: Offset(0, -3), end: Offset(0, 0)).animate(
        CurvedAnimation(parent: _controller2, curve: Curves.bounceOut));
    _animation3 = Tween(begin: Offset(0, -3), end: Offset(0, 0)).animate(
        CurvedAnimation(parent: _controller3, curve: Curves.easeInOut));
    _animation4 = Tween(begin: Offset(0, -3), end: Offset(0, 0)).animate(
        CurvedAnimation(parent: _controller4, curve: Curves.easeInOut));

    // Delay for animation
    Future.delayed(Duration(milliseconds: 1000), () {
      _controller1.forward();
    });

    _controller2.forward();
    _controller3.forward();
    _controller4.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromRGBO(114, 57, 241, 1),
            body: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Image.asset('assets/caregiver/img1.png',
                      fit: BoxFit.cover),
                ),
                CustomScrollView(
                  slivers: <Widget>[
//                    SliverAppBar(
////                      title: Text('app bar'),
//                      leading: InkWell(
//                        child: Icon(Icons.sort),
//                        onTap: () => widget.sKey.currentState.openDrawer(),
//                      ),
//                      backgroundColor: Colors.transparent,
//                      elevation: 1.0,
//                      expandedHeight: 200,
//                      pinned: true,
//                      centerTitle: true,
//                      flexibleSpace: FlexibleSpaceBar(
//                        title: Text('Care Giver'),
//                      ),
//                    ),
                    SliverPersistentHeader(
//                      pinned: true,
                      delegate: CustomSliverHeaderDelegate(
                          expandedHeight: 150,
                          hideTitleWhenExpand: true,
                          sKey: widget.sKey),
                    ),
//                    SliverToBoxAdapter(
//                      child: Card(
//                        child: Text('body'),
//                      ),
//                    ),
                    SliverFillRemaining(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Card(
                        child: SlideTransition(
                          position: _animation1,
                          child: DefaultTabController(
                              length: 3,
                              child: Column(
                                children: <Widget>[
                                  TabBar(
                                    onTap: (int i) {
                                      _tab_active = i;
                                      setState(() {});
                                    },
                                    tabs: <Widget>[
                                      Tab(
                                        text: 'Home',
                                      ),
                                      Tab(
                                        text: 'About',
                                      ),
                                      Tab(
                                        text: 'Contact',
                                      ),
                                    ],
                                    labelColor: Colors.deepPurpleAccent,
                                    unselectedLabelColor: Colors.grey,
                                    indicatorColor: Colors.deepPurpleAccent,
                                    isScrollable: false, // scrollable
                                  ),
                                  SizedBox( // 1 widget like Container
                                    height: 10,
                                  ),
                                  Visibility(
                                      visible: _tab_active == 0,
                                      child: Container(
                                        height: 200,
                                        child: ListView(
                                          children: <Widget>[
                                            for (var i = 0; i < 1000; i++)
                                              ListTile(
                                                title: Text('text text text'),
                                                leading: Text('${i}'),
                                              )
                                          ],
                                        ),
                                      )),
                                  Visibility(
                                    visible: _tab_active == 1,
                                    child: CustomText(
                                      'tab 2222 tab 2222 tab 2222 tab 2222 tab 2222 tab 2222 tab 2222 tab 2222 tab 2222 tab 2222 tab 2222 tab 2222 tab 2222 tab 2222 ',
                                      style: TextStyle(color: Colors.red),
                                      maxLength: 10,
                                    ),
                                  ),
                                  Visibility(
                                    visible: _tab_active == 2,
                                    child: Container(
                                      child: Text('custom tab 3'),
//                                    child: NestedScrollView(
//                                      headerSliverBuilder: (context, scrolling) {
//                                        return <Widget>[
//                                          Container()
//                                        ];
//                                      },
//                                      body: TabBarView(
//                                        children: <Widget>[
//                                          Text('tab 1'),
//                                          Text('tab 2'),
//                                        ],
//                                      ),
//                                    ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    )),
                    SliverList(
                        delegate: SliverChildListDelegate(_buildList(10)))
                  ],
                ),
              ],
            )));
  }

  List<Widget> _buildList(num) {
    List<Widget> itemlist = new List();

    for (int i = 1; i <= num; i++) {
      itemlist.add(Container(
          padding: EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: Colors.white.withOpacity(0.3),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child: Text('row $i'),
            ),
          )));
    }
    return itemlist;
  }
}

class CustomText extends Text {
  // đang thử custom lại Text
  final int maxLength;

  @override
  CustomText(data,
      {Key key,
      style,
      strutStyle,
      textAlign,
      textDirection,
      locale,
      softWrap,
      overflow,
      textScaleFactor,
      maxLines,
      semanticsLabel,
      textWidthBasis,
      this.maxLength})
      : super(data, style: style);

//  factory CustomText.fromJson() {
//    return CustomText(data, style: style,);
//  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var newtext = data.substring(0, maxLength);
    print(newtext);
    print(context);
    return super.build(context);
  }
}

class CustomSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpand;
  final GlobalKey<ScaffoldState> sKey;

  CustomSliverHeaderDelegate(
      {this.expandedHeight, this.hideTitleWhenExpand, this.sKey});

  @override
  double get minExtent => kToolbarHeight; // const of toolbar height ( 56.0 )

  @override
  double get maxExtent => expandedHeight + expandedHeight / 9;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: InkWell(
        child: Icon(Icons.sort),
        onTap: () => sKey.currentState.openDrawer(),
      ),
      title: Text(
        'Care giver',
        style: TextStyle(
            fontFamily: 'Roboto Medium',
            fontWeight: FontWeight.w600,
            color: Colors.white),
      ),
    );
  }
}
