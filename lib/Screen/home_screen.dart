import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Consts/consts.dart';
import 'package:flutter_app/Screen/AnimationScreen.dart';
import 'package:flutter_app/Screen/MusicPlayerScreen.dart';
import 'package:flutter_app/Screen/VinidHome.dart';
import 'package:flutter_app/Screen/careGiver/careGiver_home_screen.dart';
import 'package:flutter_app/Screen/careGiver/careGiver_splash_screen.dart';
import 'package:flutter_app/Screen/gridViewComponent.dart';
import 'package:flutter_app/Screen/loginScreen.dart';
import 'package:flutter_app/Models/models.dart';
import 'package:flutter_app/Screen/otpScreen.dart';
import 'package:flutter_app/myDrawer.dart';
import 'package:flutter_app/style.dart';

// https://github.com/flutter-devs/flutter_paytm_clone/blob/master/lib/ui/paytm.dart

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Home screen',
      home: new _HomeScreen(),
      theme: ThemeData(primarySwatch: Colors.red),
      routes: <String, WidgetBuilder>{
        LOGIN_SCREEN: (BuildContext context) => LoginScreen(),
        HOME_SCREEN: (BuildContext context) => HomeScreen(),
        OTP_SCREEN: (BuildContext context) => OtpScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class _HomeScreen extends StatefulWidget {
//  _HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreen> {
  var page_of_grid_top = 0;
  var activeTab = 0;
  var mainColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    print('Active Tab: ${activeTab}');
    // TODO: implement build

    if (activeTab == 1)
      mainColor = Colors.blue;
    else
      mainColor = Colors.red;

    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: _bottomTab(),
      backgroundColor: Colors.grey[200],
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.print),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _appBar() {
    return new AppBar(
      title: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Container(
              child: Stack(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                          left: 50, top: 0, bottom: 6, right: 40),
                    ),
                    onSubmitted: (val) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GridViewComponent(mynumber: '100', q: val)));
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12, top: 8),
                    child: Icon(
                      Icons.search,
                      color: mainColor,
                    ),
                  ),
                  Positioned(
                    child: InkWell(
                      child: Image.asset(
                        'assets/images/qr-code.png',
                        width: 22,
                        height: 22,
                      ),
                      onTap: () {},
                    ),
                    top: 8,
                    right: 8,
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              height: 40,
              width: MediaQuery.of(context).size.width - 88,
            ),
          )
        ],
        mainAxisSize: MainAxisSize.max,
      ),
      backgroundColor: mainColor,
    );
  }

  Widget _body() {
    return new RefreshIndicator(
      child: new SingleChildScrollView(
        // If the Scrollable might not have enough content to overscroll, consider settings its physics property to AlwaysScrollableScrollPhysics:
        child: new Column(
          children: <Widget>[
            Container(
              width: double.maxFinite,
              color: mainColor[800],
              child: Stack(
                  // add new dependencies and update with : flutter pub get
                  children: [
                    CarouselSlider(
                      items: List<GridView>.generate(2, (int index) {
                        return GridView.count(
                            crossAxisCount: 4,
                            children:
                                List<GridItemOnTop>.generate(4, (int index) {
                              return GridItemOnTop(_getGridList()[
                                  index + (page_of_grid_top * 4)]);
                            }));
                      }),
                      reverse: false,
                      aspectRatio: 5,
                      viewportFraction: 1.0,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true,
                      onPageChanged: (pageIndex) {
                        setState(() {
                          page_of_grid_top = pageIndex;
                        });
                      },
                    ),
                    Positioned(
                        bottom: 0,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(2, (int index) {
                              return new IndicatorOfCarousel(
                                currentPage: page_of_grid_top,
                                index: index,
                              );
                            })))
                  ]),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.airline_seat_individual_suite,
                    color: Colors.deepPurple,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text('ahihi hi hi..'),
                    ),
                    flex: 1,
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.grey[400],
                  )
                ],
              ),
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
//                height: 30,
              padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
              decoration: new BoxDecoration(
//                border: Border(
//                  bottom: BorderSide(color: Colors.grey[300], width: 1.0),
//                ),
                color: Colors.white,
              ),
            ),
            GridView.count(
              crossAxisCount: 4,
              // https://medium.com/flutterpub/flutter-listview-gridview-inside-scrollview-68b722ae89d4
              // Scrollable widget không thể nằm trong 1 scrollable widget khác.
              shrinkWrap: true,
              // Thêm thuộc tính này để không scroll widget này -> fixed
              physics: NeverScrollableScrollPhysics(),
              children: List<CustomGridItem>.generate(12, (int index) {
                return CustomGridItem(
                  gridModel: _getGridItemList()[index],
                );
              }),
            ),
            Container(
              margin: EdgeInsets.only(top: 8.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _getBanner(),
              ),
              height: 150,
            )
          ],
        ),
        physics:
            const AlwaysScrollableScrollPhysics(), // Using AlwaysScrollableScrollPhysics will ensure that the scroll view is always scrollable and, therefore, can trigger the RefreshIndicator.
      ),
      onRefresh: _pullToRefresh,
    );
  }

  Widget _bottomTab() {
//    return new BottomNavigationBar(
//      items: [
//        new Style().navBarStyle('Home', 'assets/images/home.png'),
//        new Style().navBarStyle('Scan', 'assets/images/qr-code.png'),
////        new Style().navBarStyle('Shop', 'assets/images/shopping-bagg.png'),
//        BottomNavigationBarItem(icon: Icon(Icons.accessible, color: Colors.red,), title: Text('ACC')),
//      ],
//      currentIndex: activeTab,
//      onTap: (newIndex) => setState(() => activeTab = newIndex),
//    );
    final height = 55.0;
    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          InkWell(
              child: Container(
            height: height,
            child: Padding(
              padding: EdgeInsets.only(top: 8),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/home.png',
                    width: 20,
                    color: Colors.red,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Text(
                      'Home',
                      style: TextStyle(fontSize: 12, color: Colors.red),
                    ),
                  )
                ],
              ),
            ),
          )),
          InkWell(
              child: Container(
            height: height,
            child: Padding(
              padding: EdgeInsets.only(top: 8),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/shopping-bagg.png',
                    width: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Text(
                      'Shop',
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          )),
          Container(
            height: height,
          ),
          InkWell(
              child: Container(
            height: height,
            child: Padding(
              padding: EdgeInsets.only(top: 8),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/access.png',
                    width: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Text(
                      'Ticket',
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          )),
          InkWell(
              child: Container(
            height: height,
            child: Padding(
              padding: EdgeInsets.only(top: 8),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/console.png',
                    width: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Text(
                      'Game',
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          )),
        ],
      ),
      shape: CircularNotchedRectangle(),
      color: Colors.white,
    );
  }

  List<GridModel> _getGridItemList() {
    List<GridModel> list = new List<GridModel>();
    list.add(new GridModel(
        "assets/images/smartphone.png", "Mobile\nprepaid", null, () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => VinidHome()));
    }));
    list.add(new GridModel("assets/images/airplane.png", "Flights", null, () {
      _promptDialog();
    }));
    list.add(
        new GridModel("assets/images/access.png", "Movie Tickets", null, null));
    list.add(new GridModel("assets/images/hand.png", "Events", null, () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => MusicPlayerScreen()));
    }));
    list.add(new GridModel("assets/images/phone-charge.png",
        "Mobile        Postpaid", null, null));
    list.add(new GridModel("assets/images/console.png", "Games", null, null));
    list.add(new GridModel("assets/images/gold.png", "Gold", null, null));
    list.add(
        new GridModel("assets/images/iocl_tip.png", "Electricity", null, null));
    list.add(new GridModel(
        "assets/images/train_help.png", "Train Tickets", null, null));
    list.add(
      new GridModel("assets/images/shopping-bag.png", "Shopping", null, null),
    );
    list.add(
        new GridModel("assets/images/satellite-dish.png", "DTH", null, null));
    list.add(new GridModel(
        "assets/images/placeholder_inapp_merchants.png", "More", null, null));
    return list;
  }

  List<GridModel> _getGridList() {
    List<GridModel> list = new List<GridModel>();
    list.add(new GridModel(
        "assets/images/send_money.png", "Pay", Colors.white, null));
    list.add(new GridModel(
        "assets/images/money_transfer.png", "UPI", Colors.white, null));
    list.add(new GridModel("assets/images/ic_passbook_header.png", "Passbook",
        Colors.white, null));
    list.add(new GridModel("assets/images/calendar_blue.png", "Paytm\nPostpaid",
        Colors.white, null));
    list.add(new GridModel("assets/images/add_money_passbook.png", "Add Money",
        Colors.white, null));
    list.add(new GridModel(
        "assets/images/book.png", "Link Account", Colors.white, null));
    list.add(new GridModel("assets/images/ic_passbook_header.png",
        "Link Account", Colors.white, null));
    list.add(new GridModel(
        "assets/images/book.png", "Link Account", Colors.white, null));

    return list;
  }

  List<Container> _getBanner() {
    List<Container> list = new List<Container>();

    final arr = [
      'assets/images/mobilebanner.png',
      'assets/images/banner3.png',
      'assets/images/gstbanner.png',
    ];

    arr.forEach((item) {
      list.add(Container(
        child: Image.asset(
          item,
          fit: BoxFit.cover,
        ),
        width: MediaQuery.of(context).size.width * 0.8,
        margin: EdgeInsets.only(left: 8.0),
      ));
    });

    return list;
  }

  Future _pullToRefresh() {
    print('Home screen refresh');
    return refreshHome();
  }

  refreshHome() async {
    await print('refreshing...');
  }

  void _promptDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('showing dialog...'),
            actions: <Widget>[
              FlatButton(
                child: new Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}

class GridItemOnTop extends StatelessWidget {
  final GridModel gridModel;

  GridItemOnTop(this.gridModel);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset(
                gridModel.imagePath,
                width: 30,
                height: 30,
                color: gridModel.color,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomGridItem extends StatelessWidget {
  final GridModel gridModel;

  CustomGridItem({this.gridModel});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300], width: 0.5),
            color: Colors.white),
        child: Center(
          child: InkWell(
              onTap: () {
                if (gridModel.callBack != null) {
                  gridModel.callBack();
                } else {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0)),
                            ),
                            child: ListView(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: <Widget>[
                                ListTile(
                                  title: InkWell(
                                    child: Text('Screen 1'),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  VinidHome()));
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: InkWell(
                                    child: Text('Music Screen'),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MusicPlayerScreen()));
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: InkWell(
                                    child: Text('Care Giver Screen'),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CareGiverSplashScreen()));
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: InkWell(
                                    child: Text('Animation Screen'),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AnimationScreen()));
                                    },
                                  ),
                                )
                              ],
                            ));
                      });
                }
              },
              child: Container(
                padding: EdgeInsets.all(20),
                child: Image.asset(
                  gridModel.imagePath,
                  width: 30,
                  height: 30,
                  color: gridModel.color,
                ),
              )),
        ));
  }
}

class IndicatorOfCarousel extends StatelessWidget {
  final currentPage;
  final index;

  IndicatorOfCarousel({this.currentPage, this.index});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if (currentPage == index) {
      return Container(
        width: 6.0,
        height: 6.0,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      );
    } else {
      return Container(
        width: 4.0,
        height: 4.0,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.white70),
      );
    }
  }
}
