import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personal_site_flutter/components/animated_box.dart';
import 'package:personal_site_flutter/components/background.dart';
import 'package:personal_site_flutter/components/name_container.dart';
import 'package:personal_site_flutter/components/sidebar.dart';
import 'package:personal_site_flutter/constants.dart';
import 'package:personal_site_flutter/shopify_image_repo/screens/signed_in_image_repo.dart';
import 'package:personal_site_flutter/util.dart';

class CreateAccount extends StatefulWidget {
  static const String kID = 'create_account';

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController nameController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(
            foregroundDecoration: BoxDecoration(
              backgroundBlendMode: BlendMode.saturation,
              color: Colors.grey,
            ),
          ),
          Positioned(
            height:
                MediaQuery.of(context).size.height * kHeaderHeightMultiplier,
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
          Center(
            child: AnimatedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 400,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Welcome! Please enter a display name.',
                        style: kNavTextStyle.copyWith(fontSize: 25),
                      ),
                      Text(
                        'Others may see this, so be polite!',
                        style: kNavTextStyle.copyWith(fontSize: 25),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: nameController,
                          style: kParagraphTextStyle.copyWith(fontSize: 18),
                          decoration: InputDecoration(
                            labelText: 'Enter display name',
                            prefixIcon: Icon(Icons.contacts),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          bool confirm =
                              await _confirmDisplayName(nameController.text);
                          if (confirm) {
                            await auth.currentUser.updateProfile(
                                displayName: nameController.text);

                            _addUser(nameController.text);
                            Navigator.pushNamed(context, SignedInImageRepo.kID);
                          }
                        },
                        child: Text(
                          'Continue',
                          style: kNavTextStyle.copyWith(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Sidebar(
            githubUrl:
                'https://github.com/haydenjeanson/personal_site_flutter/tree/master/lib/shopify_image_repo',
          ),
        ],
      ),
    );
  }

  Future<bool> _confirmDisplayName(String displayName) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Text('Confirm Selection'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want the display name $displayName?'),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ButtonStyle(),
              child: Text(
                'Cancel',
                style: kNavTextStyle,
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => Theme.of(context).colorScheme.onBackground),
              ),
              child: Text(
                'Confirm',
                style: kNavTextStyle,
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  Future _addUser(String displayName) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(Util.getCurrentUser(auth))
        .set({'displayName': displayName});
  }
}
