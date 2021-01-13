import 'package:flutter/material.dart';
import 'package:personal_site_flutter/components/animated_box.dart';
import 'package:personal_site_flutter/components/sidebar.dart';
import 'package:personal_site_flutter/screens/shopify_image_repo.dart';

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
        AnimatedBox(
          child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, ShopifyImageRepo.kID),
            child: Container(
              child: Text("Shopify Image Repository"),
            ),
          ),
        ),
        Sidebar(),
      ]),
    );
  }
}
