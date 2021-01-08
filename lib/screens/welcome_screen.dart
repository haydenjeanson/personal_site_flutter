import 'package:flutter/material.dart';
import 'package:personal_site_flutter/components/background.dart';
import 'package:personal_site_flutter/components/name_container.dart';
import 'package:personal_site_flutter/components/radial_menu.dart';
import 'package:personal_site_flutter/components/sidebar.dart';
import 'package:personal_site_flutter/constants.dart';

import '../constants.dart';

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
          Background(),
          Positioned(
            height: MediaQuery.of(context).size.height * 2 / 3,
            width: MediaQuery.of(context).size.width * 2 / 3,
            top: MediaQuery.of(context).size.height / 6,
            right: MediaQuery.of(context).size.height / 8,
            child: NameContainer(
              text: 'Hayden\n    Jeanson',
            ),
          ),
          Sidebar(),
        ],
      ),
    );
  }
}
