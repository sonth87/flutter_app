import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Consts/consts.dart';
import 'package:flutter_app/Screen/VinidHome.dart';

class OtpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OtpScreenState();
  }
}

class OtpScreenState extends State<OtpScreen> {
  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  TextEditingController controller3 = new TextEditingController();
  TextEditingController controller4 = new TextEditingController();
  TextEditingController controller5 = new TextEditingController();
  TextEditingController controller6 = new TextEditingController();

  FocusNode focusInput1 = new FocusNode();
  FocusNode focusInput2 = new FocusNode();
  FocusNode focusInput3 = new FocusNode();
  FocusNode focusInput4 = new FocusNode();
  FocusNode focusInput5 = new FocusNode();
  FocusNode focusInput6 = new FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('Enter OTP'),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.grey[300],
      body: Container(
          child: Column(
        children: <Widget>[
          Flexible(
            child: Column(
              children: <Widget>[
                Padding(
                  child: Text(
                    'Verifying your number!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  padding: EdgeInsets.only(top: 10.0),
                ),
                Padding(
                  child: Text(
                    'Please type the verification code sent to',
                  ),
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                ),
                Text(
                  '0987654321',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ],
            ),
            flex: 1,
          ),
          Flexible(
            child: Row(
              children: listInputNumber(),
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            flex: 2,
          ),
        ],
      )),
    );
  }

  listInputNumber() {
    List<Widget> list = [];

    final controllerList = [
      {'inputcontroler': controller1, 'focus': focusInput1},
      {'inputcontroler': controller2, 'focus': focusInput2},
      {'inputcontroler': controller3, 'focus': focusInput3},
      {'inputcontroler': controller4, 'focus': focusInput4},
      {'inputcontroler': controller5, 'focus': focusInput5},
      {'inputcontroler': controller6, 'focus': focusInput6},
    ];
    controllerList.asMap().forEach((index, value) {
      var item = Padding(
        padding: const EdgeInsets.only(right: 2.0, left: 2.0),
        child: new Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              border:
                  Border.all(width: 1.0, color: Color.fromRGBO(0, 0, 0, 0.1)),
              borderRadius: BorderRadius.circular(4.0)),
          width: 45,
          height: 45,
          child: new TextField(
            controller: value['inputcontroler'],
            inputFormatters: [LengthLimitingTextInputFormatter(1)],
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, color: Colors.red),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              if (controller1.value.text != '' &&
                  controller2.value.text != '' &&
                  controller3.value.text != '' &&
                  controller4.value.text != '' &&
                  controller5.value.text != '' &&
                  controller6.value.text != '') {
//                Navigator.of(context).pushReplacementNamed(HOME_SCREEN);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => VinidHome()));
              }
              if (value != '' && index < controllerList.length - 1) {
                FocusScope.of(context)
                    .requestFocus(controllerList[index + 1]['focus']);
              }
            },
            focusNode: value['focus'],
            autofocus: index == 0 ? true : false,
          ),
        ),
      );

      list.add(item);
    });

    return list;
  }
}
