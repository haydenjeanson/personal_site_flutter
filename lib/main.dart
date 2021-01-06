import 'package:flutter/material.dart';
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
          colorScheme: ColorScheme(
            background: Color(0xFFE64A19),
            brightness: Brightness.light,
            error: Colors.red,
            onError: Colors.black,
            onBackground: Color(0xFFFFC107),
            onPrimary: Color(0xFF1A1A1A),
            onSecondary: Color(0xFF757575),
            primary: Color(0xFFFF5722),
            primaryVariant: Color(0xFF772106),
            secondary: Color(0xFFFFCCBC),
            secondaryVariant: Color(0xFFCC7C64),
            surface: Color(0xFFBDBDBD),
            onSurface: Colors.black,
          ),
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
