import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:personal_site_flutter/components/animated_box.dart';
import 'package:personal_site_flutter/components/background.dart';
import 'package:personal_site_flutter/components/sidebar.dart';
import 'package:personal_site_flutter/shopify_image_repo/components/sign_in.dart';
import 'package:personal_site_flutter/constants.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:personal_site_flutter/shopify_image_repo/components/signed_in_image_repo.dart';

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
        Background(
          foregroundDecoration: BoxDecoration(
            backgroundBlendMode: BlendMode.saturation,
            color: Colors.grey,
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: SignIn(
            authenticatedWidget: SignedInImageRepo(),
          ),
        ),
        Sidebar(),
      ]),
    );
  }
}
