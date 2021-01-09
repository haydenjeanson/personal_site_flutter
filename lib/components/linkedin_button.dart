import 'package:flutter/material.dart';
import 'package:personal_site_flutter/util.dart';

class LinkedinButton extends StatelessWidget {
  final url;

  LinkedinButton({this.url});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        Util.launchURL(this.url);
      },
      hoverColor: Colors.black.withOpacity(0.3),
      shape: CircleBorder(),
      constraints: BoxConstraints(minHeight: 0, minWidth: 0),
      child: Container(
        child: Image.asset(
          'images/LI-In-Bug.png',
          height: MediaQuery.of(context).size.width / 18,
          width: MediaQuery.of(context).size.width / 18,
        ),
      ),
    );
  }
}
