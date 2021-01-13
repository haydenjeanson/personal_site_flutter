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
      child: LitAuthInit(
        authProviders: AuthProviders(google: true, anonymous: true),
        child: LitAuthState(
          authenticated: Test(),
          unauthenticated: LitAuth(
            config: AuthConfig(
              title: Text(
                "Sign In / Register",
                style: kNavTextStyle.copyWith(fontSize: 32),
              ),
              emailTextField: TextFieldConfig(
                inputDecoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  labelText: 'Email',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.signOut(),
      child: Text(
        'Sign Out',
        style: kNavTextStyle,
      ),
    );
  }
}
