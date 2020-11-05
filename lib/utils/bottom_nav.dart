import 'package:flutter/material.dart';

final mainBottomBar = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        color: Colors.white,
      ),
      title: Text(
        "မူလစာမျက်နှာ",
        style: TextStyle(color: Colors.white),
      ),
      activeIcon: Icon(
        Icons.home,
        color: Colors.yellow,
        size: 30,
      )),
  BottomNavigationBarItem(
      icon: Icon(
        Icons.new_releases,
        color: Colors.white,
      ),
      title: Text("သတင်းများ", style: TextStyle(color: Colors.white)),
      activeIcon: Icon(
        Icons.new_releases,
        color: Colors.yellow,
        size: 30,
      )),
  BottomNavigationBarItem(
      icon: Icon(
          Icons.settings,
          color: Colors.white
      ),
      title: Text("ပြင်ဆင်ရန်", style: TextStyle(color: Colors.white)),
      activeIcon: Icon(
        Icons.settings,
        color: Colors.yellow,
        size: 30,
      ))
];