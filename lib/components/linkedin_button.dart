import 'package:flutter/material.dart';
import 'package:personal_site_flutter/util.dart';

class LinkedinButton extends StatelessWidget {
  final url;

  LinkedinButton({this.url});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: RawMaterialButton(
        onPressed: () {
          Util.launchURL(this.url);
        },
        hoverColor: Colors.black.withOpacity(0.3),
        constraints: BoxConstraints(minHeight: 0, minWidth: 0),
        child: Container(
          child: Image.asset(
            'images/LI-In-Bug.png',
            height: MediaQuery.of(context).size.height / 11,
            width: MediaQuery.of(context).size.height / 11,
          ),
        ),
      ),
    );
  }
}
