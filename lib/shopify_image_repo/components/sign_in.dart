import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:personal_site_flutter/components/animated_box.dart';
import 'package:personal_site_flutter/constants.dart';

class SignIn extends StatelessWidget {
  final Widget authenticatedWidget;

  const SignIn({@required this.authenticatedWidget});

  @override
  Widget build(BuildContext context) {
    return AnimatedBox(
      opacity: 0.6,
      child: LitAuthInit(
        authProviders: AuthProviders(google: true, anonymous: true),
        child: LitAuthState(
          authenticated: authenticatedWidget,
          unauthenticated: Container(
            alignment: Alignment.bottomCenter,
            constraints: BoxConstraints.tight(
                Size(MediaQuery.of(context).size.width / 2, 580)),
            child: LitAuth(
              config: AuthConfig(
                title: Text(
                  "Shopify Backend Challenge: Image Repository",
                  style: kNavTextStyle.copyWith(fontSize: 44),
                  textAlign: TextAlign.center,
                ),
                emailTextField: TextFieldConfig(
                  style: kParagraphTextStyle,
                ),
                passwordTextField: TextFieldConfig(
                  style: kParagraphTextStyle,
                ),
                signInButton: ButtonConfig.raised(
                  themedata: buttonData,
                  child: Text(
                    "Sign in",
                    style: kParagraphTextStyle,
                  ),
                ),
                registerButton: ButtonConfig.raised(
                  themedata: buttonData,
                  child: Text(
                    "Register",
                    style: kParagraphTextStyle,
                  ),
                ),
                anonymousButton: ButtonConfig.raised(
                  themedata: buttonData,
                  child: Text(
                    "Continue Anonymously",
                    style: kParagraphTextStyle.copyWith(fontSize: 18),
                  ),
                ),
                googleButton: GoogleButtonConfig.dark(
                    label: Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(
                    "Continue with Google",
                    style: kParagraphTextStyle.copyWith(
                        fontSize: 18, color: Colors.white),
                  ),
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

ButtonThemeData buttonData = ButtonThemeData(
  buttonColor: kSecondaryColour,
  padding: EdgeInsets.all(16.0),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
  ),
);
