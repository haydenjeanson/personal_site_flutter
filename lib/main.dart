import 'package:flutter/material.dart';
import 'package:personal_site_flutter/constants.dart';
import 'package:personal_site_flutter/screens/contact_me.dart';
import 'package:personal_site_flutter/screens/projects.dart';
import 'package:personal_site_flutter/screens/shopify_image_repo.dart';
import 'package:personal_site_flutter/screens/welcome_screen.dart';
import 'package:personal_site_flutter/screens/about_me.dart';

FocusNode focusNode = FocusNode();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hayden Jeanson',
        theme: ThemeData(
          textSelectionTheme:
              TextSelectionThemeData(cursorColor: Color(0xFF3A3A3A)),
          primaryColor: kMainColourScheme.primary,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: kMainColourScheme.primary,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          colorScheme: kMainColourScheme,
          dividerTheme: DividerThemeData(
            color: kMainColourScheme.secondaryVariant,
            thickness: 2,
          ),
        ),
        home: WelcomeScreen(),
        initialRoute: WelcomeScreen.kID,
        routes: {
          WelcomeScreen.kID: (context) => WelcomeScreen(),
          AboutMe.kID: (context) => AboutMe(),
          Projects.kID: (context) => Projects(),
          ContactMe.kID: (context) => ContactMe(),
          ShopifyImageRepo.kID: (context) => ShopifyImageRepo(),
        });
  }
}
