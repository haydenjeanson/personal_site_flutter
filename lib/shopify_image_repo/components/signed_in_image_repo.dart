import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:personal_site_flutter/components/animated_box.dart';
import 'package:personal_site_flutter/constants.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';

class SignedInImageRepo extends StatefulWidget {
  @override
  _SignedInImageRepoState createState() => _SignedInImageRepoState();
}

class _SignedInImageRepoState extends State<SignedInImageRepo> {
  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: [
        Container(),
        Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 200.0),
            child: ElevatedButton(
              style: ButtonStyle(),
              onPressed: () => context.signOut(),
              child: Text(
                'Sign Out',
                style: kNavTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
