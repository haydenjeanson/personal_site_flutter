import 'package:flutter/material.dart';
import 'package:personal_site_flutter/components/sidebar.dart';

class ContactMe extends StatefulWidget {
  static const String kID = 'contact_me';

  @override
  _ContactMeState createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Sidebar(),
      ]),
    );
  }
}
