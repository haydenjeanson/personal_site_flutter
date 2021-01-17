import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:personal_site_flutter/components/animated_box.dart';
import 'package:personal_site_flutter/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_site_flutter/util.dart';

class SignIn extends StatefulWidget {
  final String routeOnAuth;
  SignIn({@required this.routeOnAuth});

  @override
  _SignInState createState() => _SignInState(routeOnAuth: this.routeOnAuth);
}

class _SignInState extends State<SignIn> {
  final String routeOnAuth;

  _SignInState({@required this.routeOnAuth});

  FirebaseAuth auth = FirebaseAuth.instance;
  static const _opacity = 0.2;

  Future<UserCredential> anonymousSignIn() async {
    return await this.auth.signInAnonymously();
  }

  Future<UserCredential> googleSignIn() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    return await this.auth.signInWithPopup(googleProvider);
  }

  // Future<void> _addUser(String uid) {
  //   return FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(uid)
  //       .collection('images')
  //       .add();
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (auth.currentUser != null)
      Navigator.pushReplacementNamed(context, this.routeOnAuth);

    return AnimatedBox(
      opacity: 0.6,
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.tight(
            Size(MediaQuery.of(context).size.width / 2, 580)),
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints.tight(Size(200, 50)),
              child: Stack(
                children: [
                  Container(
                    constraints: BoxConstraints.tight(Size(300, 100)),
                    child: FittedBox(
                      child: Image.asset(
                        'images/google_sign_in_dark.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (auth.currentUser != null)
                        Navigator.pushNamed(context, this.routeOnAuth);
                      UserCredential user = await googleSignIn();
                      if (user != null) {
                        // bool exists = false;
                        // FirebaseFirestore.instance
                        //     .collection('users')
                        //     .get()
                        //     .then(
                        //   (value) {
                        //     value.docs
                        //         .takeWhile((value) => user.user.uid != value.id)
                        //         .forEach((doc) {
                        //       if (user.user.uid == doc.id) {
                        //         exists = true;
                        //       }
                        //     });
                        //   },
                        // );

                        // if (!exists) {
                        //   _addUser(user.user.uid);
                        // }
                        Navigator.pushNamed(context, this.routeOnAuth);
                      }
                    },
                    child: Container(),
                    style: invisibleButton().copyWith(
                        overlayColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.black.withOpacity(_opacity))),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (auth.currentUser != null)
                  Navigator.pushNamed(context, this.routeOnAuth);

                UserCredential user = await anonymousSignIn();

                if (user != null)
                  Navigator.pushNamed(context, this.routeOnAuth);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Continue Anonymously",
                  style: kParagraphTextStyle.copyWith(fontSize: 18),
                ),
              ),
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith(
                    (_) => Colors.black.withOpacity(_opacity)),
                shape: MaterialStateProperty.resolveWith((states) =>
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0))),
                backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => Theme.of(context).colorScheme.secondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
