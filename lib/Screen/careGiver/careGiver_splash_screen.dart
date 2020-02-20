import 'package:flutter/material.dart';
import 'package:flutter_app/Models/splashModel.dart';
import 'package:flutter_app/Screen/careGiver/careGiver_home_screen.dart';

class CareGiverSplashScreen extends StatefulWidget {
  @override
  _CareGiverSplashScreenState createState() => _CareGiverSplashScreenState();
}

class _CareGiverSplashScreenState extends State<CareGiverSplashScreen> {
  double _height;
  double _width;

  int currentPage = 0;
  List<SplashModel> splashList;

  PageController controller;

  @override
  void initState() {
    super.initState();

    currentPage = 0;

    splashList = [
      SplashModel('assets/caregiver/care1.png'),
      SplashModel('assets/caregiver/care-2.png'),
      SplashModel('assets/caregiver/care-3.png'),
    ];

    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Care giver',
          style: TextStyle(
              fontFamily: 'Roboto Medium', fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(114, 57, 241, 1),
        elevation: 0.0,
      ),
      body: Container(
        height: _height,
        width: _width,
        color: Color.fromRGBO(114, 57, 241, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                child: PageView.builder(
                  physics: ClampingScrollPhysics(),
                  // https://api.flutter.dev/flutter/widgets/ClampingScrollPhysics-class.html
                  itemCount: splashList.length,
                  controller: controller,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildSplashList(splashList[index], index);
                  },
                  onPageChanged: (int index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Visibility(
                  visible: currentPage == splashList.length ? false : true,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: <Widget>[
                        // slide's dots
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            for (int i = 0; i < splashList.length; i++)
                              circle(i == currentPage ? true : false)
                          ],
                        ),

                        // Next, Back button
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      width: 50,
                                      height: 50,
                                      margin: EdgeInsets.all(12.0),
                                      alignment: Alignment.center,
                                      child: Visibility(
                                        visible: currentPage > 0 ? true : false,
                                        child: Container(
                                          padding: EdgeInsets.all(12.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color:
                                                Colors.white.withOpacity(0.2),
                                          ),
                                          child: InkWell(
                                            child: Icon(
                                              Icons.arrow_back_ios,
                                              color: Colors.white,
                                            ),
                                            onTap: () {
                                              int page = currentPage - 1;
                                              controller.animateToPage(page,
                                                  duration:
                                                      Duration(seconds: 1),
                                                  curve: Curves.bounceOut);
                                            },
                                          ),
                                        ),
                                      )),
                                  Container(
                                      width: 50,
                                      height: 50,
                                      margin: EdgeInsets.all(12.0),
                                      alignment: Alignment.center,
                                      child: Visibility(
                                        visible:
                                            currentPage < splashList.length - 1,
                                        child: Container(
                                          padding: EdgeInsets.all(12.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color:
                                                Colors.white.withOpacity(0.2),
                                          ),
                                          child: InkWell(
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.white,
                                            ),
                                            onTap: () {
                                              int page = currentPage + 1;
                                              controller.animateToPage(page,
                                                  duration:
                                                      Duration(milliseconds: 500),
                                                  curve: Curves.easeInOut);
                                            },
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Done button
                        Visibility(
                          visible: currentPage == splashList.length - 1,
                          child: FlatButton(
                            child: Container(
                              width: _width,
                              height: 45,
                              alignment: Alignment.center,
                              child: Text(
                                'Go to Home Screen',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0),
                              ),
                            ),
                            color: Colors.cyan,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0)),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CareGiverHomeScreen()));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSplashList(SplashModel model, index) {
    return Padding(
      padding: EdgeInsets.all(32.0),
//      child: Image.asset(model.img),
      child: Stack(
        // tạo background cho ... đẹp 😊
        children: <Widget>[
          Center(
            child: Transform.rotate(
              angle: 0.4,
              child: ClipOval(
                child: Container(
                  height: _height / 4,
                  width: _width / 1.2,
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
            ),
          ),
          Center(
            child: Image.asset(model.img),
          )
        ],
      ),
    );
  }

  Widget circle(bool isActive) {
    if (isActive) {
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
