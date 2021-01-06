import 'package:flutter/material.dart';
import 'package:personal_site_flutter/components/name_container.dart';
import 'package:personal_site_flutter/components/radial_menu.dart';
import 'package:responsive_image/responsive_image.dart';

import '../contants.dart';

class WelcomeScreen extends StatefulWidget {
  static const String kID = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ResponsiveImage(
            srcSet: {
              2560: "images/welcome_screen/wallpaper-2560.jpg",
              1280: "images/welcome_screen/wallpaper-1280.jpg",
              320: "images/welcome_screen/wallpaper-640.jpg",
            },
            builder: (BuildContext context, String src) {
              return Image.asset(
                src,
                fit: BoxFit.fill,
                height: double.infinity,
                width: double.infinity,
              );
            },
          ),
          Positioned(
            height: MediaQuery.of(context).size.height * 2 / 3,
            width: MediaQuery.of(context).size.width * 2 / 3,
            top: MediaQuery.of(context).size.height / 6,
            right: MediaQuery.of(context).size.height / 8,
            child: NameContainer(
              text: 'Hayden\n    Jeanson',
            ),
          ),
          Positioned(
            left: -(MediaQuery.of(context).size.width / 3),
            child: RadialMenu(),
          ),
        ],
      ),
    );
  }
}
