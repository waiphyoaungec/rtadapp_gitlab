import 'package:flutter/material.dart';
import 'package:rtad/module/module.dart';
import 'package:rtad/screen/home.dart';

void main() {
  module();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Home()
      
    );
  }
}