import 'package:flutter/material.dart';
import 'package:personal_site_flutter/components/radial_menu.dart';
import 'package:responsive_image/responsive_image.dart';

import '../contants.dart';

class WelcomeScreen extends StatefulWidget {
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
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width / 2,
            top: MediaQuery.of(context).size.height / 4,
            right: MediaQuery.of(context).size.height / 8,
            child: Container(
              decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.background.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8.0)),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: FittedBox(
                        child: Text(
                          "Hayden\n    Jeanson",
                          style: kNavTextStyle,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0)),
                        child: Image.asset("images/welcome_screen/hayden.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding:
                  EdgeInsets.only(left: MediaQuery.of(context).size.width / 50),
              child: Container(
                height: MediaQuery.of(context).size.height / 15,
                child: RadialMenu(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
