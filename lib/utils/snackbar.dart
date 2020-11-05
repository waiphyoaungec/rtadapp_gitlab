import 'package:flutter/material.dart';
import 'package:rtad/utils/constant.dart';

extension SnckExtension on BuildContext{
  void createSnackBar(String message) {                                                                               
  final snackBar = new SnackBar(content: new Text(message),                                                         
  backgroundColor: Colors.red);                                                                                      
  Scaffold.of(this).showSnackBar(snackBar);                                                              
  }                                                                                                                   
}  
