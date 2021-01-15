import 'package:flutter/material.dart';
// import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:personal_site_flutter/components/animated_box.dart';
import 'package:personal_site_flutter/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_site_flutter/shopify_image_repo/screens/signed_in_image_repo.dart';

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

  void checkAuth() {
    auth.authStateChanges().listen((User user) {
      if (user != null) {
        Navigator.pushNamed(context, this.routeOnAuth);
      }
    });
  }

  @override
  void initState() {
    checkAuth();
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
            checkAuth();
            print('Signing in anonymously...');
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

// temporary(context, routeOnAuth, buttonData) {
//   LitAuth(
//     onAuthSuccess: () => Navigator.pushNamed(context, routeOnAuth),
//     config: AuthConfig(
//       title: Text(
//         "Shopify Backend Challenge: Image Repository",
//         style: kNavTextStyle.copyWith(fontSize: 44),
//         textAlign: TextAlign.center,
//       ),
//       emailTextField: TextFieldConfig(
//         style: kParagraphTextStyle,
//       ),
//       passwordTextField: TextFieldConfig(
//         style: kParagraphTextStyle,
//       ),
//       signInButton: ButtonConfig.raised(
//         themedata: buttonData,
//         child: Text(
//           "Sign in",
//           style: kParagraphTextStyle,
//         ),
//       ),
//       registerButton: ButtonConfig.raised(
//         themedata: buttonData,
//         child: Text(
//           "Register",
//           style: kParagraphTextStyle,
//         ),
//       ),
//       anonymousButton: ButtonConfig.raised(
//         themedata: buttonData,
//         child: Text(
//           "Continue Anonymously",
//           style: kParagraphTextStyle.copyWith(fontSize: 18),
//         ),
//       ),
//       googleButton: GoogleButtonConfig.dark(
//           label: Padding(
//         padding: EdgeInsets.only(right: 10.0),
//         child: Text(
//           "Continue with Google",
//           style:
//               kParagraphTextStyle.copyWith(fontSize: 18, color: Colors.white),
//         ),
//       )),
//     ),
//   );
// }
