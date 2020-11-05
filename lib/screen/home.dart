import 'package:flutter/material.dart';
import 'package:rtad/screen/news.dart';
import 'package:rtad/screen/service.dart';
import 'package:rtad/screen/settting.dart';
import 'package:rtad/utils/bottom_nav.dart';
import 'package:rtad/utils/constant.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  Color color = Color.fromARGB(255, 14, 94, 127);

  final _titleString = ["မူလစာမျက်နှာ", "သတင်းများ", "ပြင်ဆင်ရန်"];
  String _title = "မူလစာမျက်နှာ";

  final _screenPage = <Widget>[Service(),News(),Setting()];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor:  Const.tool,
        title: Text(_titleString[0]),
      ),
      body: Center(
        child: Container(
          child: _screenPage[_currentIndex],
          color: Colors.white70,
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.blueGrey,
        child: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 14, 94, 127),
          items: mainBottomBar,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
              _title = _titleString[index];
            });
          },
        ),
     
      )
      
    );
  }
}