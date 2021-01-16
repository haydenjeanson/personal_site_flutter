import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Util {
  static void launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Error(Util.launchURL): Could not launch $url';
    }
  }
}

ButtonStyle invisibleButton() {
  return ButtonStyle(
      shape:
          MaterialStateProperty.resolveWith((_) => ContinuousRectangleBorder()),
      overlayColor: MaterialStateProperty.resolveWith(
          (_) => Colors.black.withOpacity(0.0)),
      padding: MaterialStateProperty.resolveWith((_) => EdgeInsets.zero),
      elevation: MaterialStateProperty.resolveWith((_) => 0.0),
      backgroundColor:
          MaterialStateProperty.resolveWith((_) => Colors.red.withOpacity(0)));
}
