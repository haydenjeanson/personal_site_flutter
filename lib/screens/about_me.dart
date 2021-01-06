import "package:flutter/material.dart";
import 'package:personal_site_flutter/components/name_container.dart';
import 'package:personal_site_flutter/components/radial_menu.dart';

class AboutMe extends StatefulWidget {
  static const String kID = "about_me";

  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width * 3 / 8,
            left: ((MediaQuery.of(context).size.width) -
                    (MediaQuery.of(context).size.width * 3 / 8)) /
                2,
            top: 0,
            child: NameContainer(text: 'Hayden Jeanson'),
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
