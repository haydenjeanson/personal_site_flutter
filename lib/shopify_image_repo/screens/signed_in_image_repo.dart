import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:personal_site_flutter/components/background.dart';
import 'package:personal_site_flutter/components/name_container.dart';
import 'package:personal_site_flutter/components/sidebar.dart';
import 'package:personal_site_flutter/constants.dart';
import 'package:personal_site_flutter/shopify_image_repo/components/firebase_image.dart';
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
                  child: Column(
                    children: [
                      Container(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.resolveWith(
                                  (states) => RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(25)))),
                          onPressed: () {
                            auth.signOut();
                            Navigator.pushNamed(context, ShopifyImageRepo.kID);
                          },
                          child: Text(
                            'Sign Out',
                            style: kNavTextStyle,
                          ),
                        ),
                      ),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 4,
                          children: [
                            FirebaseImage(storage.ref('images/hayden.png')),
                            FirebaseImage(storage.ref('images/1.png')),
                          ],
                        ),
                      ),
                    ],
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
