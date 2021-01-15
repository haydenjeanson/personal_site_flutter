import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:personal_site_flutter/components/animated_box.dart';
import 'package:personal_site_flutter/components/background.dart';
import 'package:personal_site_flutter/components/body_widget.dart';
import 'package:personal_site_flutter/components/name_container.dart';
import 'package:personal_site_flutter/components/sidebar.dart';
import 'package:personal_site_flutter/constants.dart';
// import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:personal_site_flutter/shopify_image_repo/components/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_site_flutter/shopify_image_repo/screens/shopify_image_repo.dart';

class SignedInImageRepo extends StatefulWidget {
  static const String kID = "signed_in_image_repo";

  @override
  _SignedInImageRepoState createState() => _SignedInImageRepoState();
}

class _SignedInImageRepoState extends State<SignedInImageRepo> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

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
        Positioned(
          height: MediaQuery.of(context).size.height * kHeaderHeightMultiplier,
          width: MediaQuery.of(context).size.width * kHeaderWidthMultiplier,
          left: ((MediaQuery.of(context).size.width) -
                  (MediaQuery.of(context).size.width *
                      kHeaderWidthMultiplier)) /
              2,
          top: 0,
          child: NameContainer(
            text: 'Hayden Jeanson',
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * kHeaderHeightMultiplier,
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).size.height * kHeaderHeightMultiplier),
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 8,
                height: 20,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: EdgeInsets.zero,
                            child: ElevatedButton(
                              style: ButtonStyle(),
                              onPressed: () {
                                auth.signOut();
                                Navigator.pushNamed(
                                    context, ShopifyImageRepo.kID);
                              },
                              child: Text(
                                'Sign Out',
                                style: kNavTextStyle,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GridView.count(
                            crossAxisCount: 3,
                            children: [
                              Container(
                                  color: Colors.blue, child: Text("Hello")),
                              Container(
                                  color: Colors.blue, child: Text("World!")),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Sidebar(),
      ]),
    );
  }
}
