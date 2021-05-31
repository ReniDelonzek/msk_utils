import 'package:flutter/material.dart';

class Navigation {
  static push(BuildContext context, Widget widget, {dynamic args}) async {
    return await Navigator.maybeOf(context)?.push(new MaterialPageRoute(
        builder: (BuildContext context) => widget,
        settings: RouteSettings(arguments: args)));
  }

  static pushReplacement(BuildContext context, Widget widget,
      {dynamic args}) async {
    return await Navigator.maybeOf(context)?.pushReplacement(
        new MaterialPageRoute(
            builder: (BuildContext context) => widget,
            settings: RouteSettings(arguments: args)));
  }
}
