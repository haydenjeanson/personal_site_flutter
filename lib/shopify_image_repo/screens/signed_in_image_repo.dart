import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:personal_site_flutter/components/animated_box.dart';
import 'package:personal_site_flutter/components/background.dart';
import 'package:personal_site_flutter/components/name_container.dart';
import 'package:personal_site_flutter/components/sidebar.dart';
import 'package:personal_site_flutter/constants.dart';
import 'package:personal_site_flutter/shopify_image_repo/components/firebase_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_site_flutter/shopify_image_repo/screens/shopify_image_repo.dart';
import 'package:personal_site_flutter/util.dart';
import 'package:firebase/firebase.dart' as fb;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

class SignedInImageRepo extends StatefulWidget {
  static const String kID = "signed_in_image_repo";

  @override
  _SignedInImageRepoState createState() => _SignedInImageRepoState();
}

class _SignedInImageRepoState extends State<SignedInImageRepo> {
  static const int _minImageWidth = 300;

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    String displayName = auth.currentUser.displayName == null
        ? 'Anonymous'
        : auth.currentUser.displayName;
    double leftWidth = MediaQuery.of(context).size.width * kLeftWidthMultiplier;
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
          Positioned(
            top: MediaQuery.of(context).size.height * kHeaderHeightMultiplier,
            height: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).size.height * kHeaderHeightMultiplier),
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Container(
                  width: leftWidth,
                  height: 20,
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(kDefaultPad),
                    child: FutureBuilder(
                      future: _allFirebaseImages(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return GridView.count(
                            mainAxisSpacing: 1.0,
                            crossAxisCount:
                                (MediaQuery.of(context).size.width ~/
                                    _minImageWidth),
                            children: snapshot.data,
                          );
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Sidebar(
            githubUrl:
                'https://github.com/haydenjeanson/personal_site_flutter/tree/master/lib/shopify_image_repo',
          ),
          Positioned(
            width: leftWidth - kDefaultPad,
            left: kDefaultPad,
            bottom: 80,
            child: AnimatedBox(
                opacity: 0.7,
                colour: Theme.of(context).colorScheme.secondary,
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        'Signed in as:',
                        style: kNavTextStyle.copyWith(fontSize: 23),
                      ),
                      Text(
                        '$displayName',
                        style: kNavTextStyle.copyWith(fontSize: 23),
                      )
                    ],
                  ),
                )),
          ),
          Positioned(
            left: kDefaultPad,
            bottom: 40.0,
            child: _TextButton(
              auth: auth,
              text: 'Upload Image',
              leftWidth: leftWidth,
              onPressed: () async {
                await _uploadImage();
              },
            ),
          ),
          Positioned(
            left: kDefaultPad,
            bottom: kDefaultPad,
            child: _TextButton(
              auth: auth,
              text: 'Sign Out',
              leftWidth: leftWidth,
              onPressed: () {
                this.auth.signOut();

                Navigator.pushReplacementNamed(context, ShopifyImageRepo.kID);
              },
            ),
          ),
        ],
      ),
    );
  }

  _uploadImage() async {
    final FileUploadInputElement input = FileUploadInputElement();

    input..accept = 'image/*';
    input.click();

    await input.onChange.first;
    if (input.files.isNotEmpty) {
      try {
        List<String> imageType = input.files.first.type.toString().split('/');
        if (imageType[0] != 'image') {
          return false;
        }

        // Use DateTime to make risk of duplicate file names negligible
        final String imageName =
            '${DateTime.now().toString().split('.')[0]}.${imageType[1]}';

        // Need to load the image to get the width and height for firestore
        final reader = FileReader();
        reader.readAsDataUrl(input.files[0]);
        await reader.onLoad.first;
        final imageBytes = (reader.result as String)
            .replaceFirst(RegExp(r'data:image/[^;]+;base64,'), '');
        ui.Image image = await decodeImageFromList(base64.decode(imageBytes));

        // Upload image to Firebase Storage
        fb.StorageReference storageRef =
            fb.storage().ref('images/${Util.getCurrentUser(auth)}/$imageName');

        fb.UploadTaskSnapshot uploadTaskSnapshot =
            await storageRef.put(input.files.first).future;

        // Upload image info to Firebase Firestore
        String imageUrl =
            (await uploadTaskSnapshot.ref.getDownloadURL()).toString();

        FirebaseFirestore.instance
            .collection('users')
            .doc(Util.getCurrentUser(auth))
            .collection('images')
            .doc(imageName)
            .set({
          'width': image.width,
          'height': image.height,
          'url': imageUrl,
        });

        // Update gridview with new image
        setState(() {});
      } catch (e) {
        print('error:$e');
      }
    }
  }

  Future _allFirebaseImages() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    Map<String, String> imageMap = {};
    List<String> imageNames = List<String>.empty(growable: true);

    List<Column> images = List<Column>.empty(growable: true);

    await users.get().then((usersFolder) async {
      for (QueryDocumentSnapshot user in usersFolder.docs) {
        await users.doc(user.id).collection('images').get().then((imageFolder) {
          imageFolder.docs.forEach((image) {
            imageMap[image.id] = user.id;
            imageNames.add(image.id);
          });
        });
      }
    });

    for (String imageName in imageNames) {
      DocumentSnapshot userData = await users.doc(imageMap[imageName]).get();

      String author = userData.data()['displayName'];

      images.add(Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: FirebaseImage(
                this.storage.ref('images/${imageMap[imageName]}/$imageName')),
          ),
          AnimatedBox(
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPad),
              child: Text(
                'Uploaded by: $author',
                style: kParagraphTextStyle.copyWith(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ));
    }

    return images;
  }
}

class _TextButton extends StatelessWidget {
  const _TextButton({
    Key key,
    @required this.auth,
    @required this.text,
    @required this.leftWidth,
    @required this.onPressed,
  }) : super(key: key);

  final FirebaseAuth auth;
  final String text;
  final double leftWidth;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.resolveWith(
            (states) => Size(this.leftWidth, 1)),
        padding: MaterialStateProperty.resolveWith(
          (states) =>
              EdgeInsets.symmetric(horizontal: 15, vertical: kDefaultPad),
        ),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
      onPressed: this.onPressed,
      child: Text(
        this.text,
        style: kNavTextStyle.copyWith(fontSize: 23),
      ),
    );
  }
}
