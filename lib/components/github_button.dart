import 'package:flutter/material.dart';
import 'package:responsive_image/responsive_image.dart';
import 'package:personal_site_flutter/util.dart';

class GithubButton extends StatelessWidget {
  final url;

  GithubButton({this.url});

  @override
  Widget build(BuildContext context) {
    return ResponsiveImage(
      srcSet: {
        32: 'images/GitHub-Mark-32px.png',
        64: 'images/GitHub-Mark-64px.png',
        120: 'images/GitHub-Mark-120px-plus.png',
      },
      builder: (context, src) {
        return RawMaterialButton(
          onPressed: () {
            Util.launchURL(this.url);
          },
          shape: CircleBorder(),
          hoverColor: Colors.black.withOpacity(0.5),
          constraints: BoxConstraints(minHeight: 0, minWidth: 0),
          child: Image.asset(src),
        );
      },
    );
  }
}
