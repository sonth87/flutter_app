import 'package:flutter/material.dart';
import 'package:flutter_app/Screen/home_screen.dart';

class MusicPlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Music player',
      home: _MusicPlayerScreen(),
      color: Colors.black,
    );
  }
}

class _MusicPlayerScreen extends StatefulWidget {
  @override
  MusicPlayerScreenState createState() => MusicPlayerScreenState();
}

class MusicPlayerScreenState extends State<_MusicPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: _bottomBar(),
    );
  }

  Widget _appBar() {
    return AppBar(
      title: Text('Music'),
      leading: BackButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeScreen()));
        },
      ),
    );
  }

  Widget _body() {
    return Container();
  }

  Widget _bottomBar() {
    return null;
  }
}
