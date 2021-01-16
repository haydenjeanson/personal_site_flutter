import 'package:flutter/material.dart';
import 'package:personal_site_flutter/components/animated_box.dart';
import 'package:personal_site_flutter/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  final String routeOnAuth;
  SignIn({@required this.routeOnAuth});

  @override
  _SignInState createState() => _SignInState(routeOnAuth: this.routeOnAuth);
}

class _SignInState extends State<SignIn> {
  final String routeOnAuth;
  FirebaseAuth auth = FirebaseAuth.instance;

  _SignInState({@required this.routeOnAuth});

  Future<UserCredential> anonymousSignIn() async {
    return await this.auth.signInAnonymously();
  }

  @override
  void initState() {
    if (auth.currentUser != null)
      Navigator.pushNamed(context, this.routeOnAuth);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBox(
      opacity: 0.6,
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.tight(
            Size(MediaQuery.of(context).size.width / 2, 580)),
        child: ElevatedButton(
          onPressed: () {
            if (auth.currentUser != null)
              Navigator.pushNamed(context, this.routeOnAuth);
            anonymousSignIn();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Continue Anonymously",
              style: kParagraphTextStyle.copyWith(fontSize: 18),
            ),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.resolveWith((states) =>
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0))),
            backgroundColor: MaterialStateProperty.resolveWith(
                (states) => Theme.of(context).colorScheme.secondary),
          ),
        ),
      ),
    );
  }
}
