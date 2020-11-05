import 'package:flutter/material.dart';

extension myNavigator on BuildContext {
  void next(T, {String city}) {
    Navigator.push(this, MaterialPageRoute(builder: (_) => T));
  }
}
