import 'package:flutter/material.dart';
import 'package:personal_site_flutter/components/animated_box.dart';
import 'package:personal_site_flutter/components/radial_menu.dart';
import 'package:personal_site_flutter/constants.dart';

class Projects extends StatefulWidget {
  static const String kID = 'projects';

  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        AnimatedBox(),
        Positioned(
          right: (MediaQuery.of(context).size.width * kRadialMenuDistance),
          child: RadialMenu(),
        ),
      ]),
    );
  }
}
