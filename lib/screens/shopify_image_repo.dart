import 'package:flutter/material.dart';
import 'package:personal_site_flutter/components/sidebar.dart';
import 'package:personal_site_flutter/components/sign_in.dart';
import 'package:personal_site_flutter/constants.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';

class ShopifyImageRepo extends StatefulWidget {
  static const kID = 'shopify_image_repo_home';

  @override
  _ShopifyImageRepoState createState() => _ShopifyImageRepoState();
}

class _ShopifyImageRepoState extends State<ShopifyImageRepo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          alignment: Alignment.center,
          child: SignIn(
            authenticatedWidget: ElevatedButton(
              onPressed: () => context.signOut(),
              child: Text(
                'Sign Out',
                style: kNavTextStyle,
              ),
            ),
          ),
        ),
        Sidebar(),
      ]),
    );
  }
}
