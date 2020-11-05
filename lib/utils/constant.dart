import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

class Const {
  static const baseUrl = 'http://67.207.85.58/rtadapi/api';
  static Color tool = Color.fromARGB(255, 14, 94, 127);
  static String code = '12345678';
  static const keyword = 'Sb4szC7V4kKg6SsMNCBybUL8B95b5nHgjqnCszRP';
  static String getData() {
    var date = DateTime.now();
    return '${date.year}${date.month}0${date.day}';
  }

  static String changeHash(String licenceNo) {
    var bytes = utf8.encode('$keyword${getData()}$licenceNo$code'); // data being hashed
    var digest = sha256.convert(bytes);
    return digest.toString();
  }
}
