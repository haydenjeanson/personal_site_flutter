import 'package:flutter/material.dart';
import 'package:personal_site_flutter/constants.dart';
import 'package:personal_site_flutter/screens/contact_me.dart';
import 'package:personal_site_flutter/screens/projects.dart';
import 'package:personal_site_flutter/screens/welcome_screen.dart';
import 'package:personal_site_flutter/screens/about_me.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hayden Jeanson',
        theme: ThemeData(
          colorScheme: kMainColourScheme,
        ),
        home: WelcomeScreen(),
        initialRoute: WelcomeScreen.kID,
        routes: {
          WelcomeScreen.kID: (context) => WelcomeScreen(),
          AboutMe.kID: (context) => AboutMe(),
          Projects.kID: (context) => Projects(),
          ContactMe.kID: (context) => ContactMe(),
        });
  }
}
