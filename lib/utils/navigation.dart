import 'package:flutter/material.dart';

class Navigation {
  static push(BuildContext context, Widget widget) async {
    return await Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) => widget));
  }
}
