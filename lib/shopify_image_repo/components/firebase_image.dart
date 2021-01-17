import 'dart:async';
import 'dart:ui' as ui;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:personal_site_flutter/constants.dart';
import 'package:personal_site_flutter/util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseImage extends StatefulWidget {
  final Reference image;

  FirebaseImage(this.image);

  @override
  _FirebaseImageState createState() => _FirebaseImageState(this.image);
}

class _FirebaseImageState extends State<FirebaseImage> {
  final Reference image;
  _FirebaseImageState(this.image);

  static const String anonymousUser = 'anonymous';

  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String imageName;
  Map<String, double> heightMap = {};
  Map<String, double> widthMap = {};

  @override
  void initState() {
    this.imageName = this.image.fullPath.toString().split('/')[1];

    firestore
        .collection('users')
        .doc(anonymousUser)
        .collection('images')
        .doc(this.imageName)
        .get()
        .then((value) {
      this.heightMap[value.id] = value.data()['height'];
      this.widthMap[value.id] = value.data()['width'];
    });
    firestore
        .collection('users')
        .doc(_getCurrentUser())
        .collection('images')
        .doc(this.imageName)
        .get()
        .then((value) {
      try {
        this.heightMap[value.id] = value.data()['height'];
        this.widthMap[value.id] = value.data()['width'];
      } catch (_) {
        print(
            'Error (_FirebaseImageState): Value not found for user: ${_getCurrentUser()}');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder(
            future: _loadImage(image),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Stack(
                  children: [
                    snapshot.data != null
                        ? snapshot.data
                        : Container(
                            alignment: Alignment.center,
                            constraints: BoxConstraints.expand(),
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(kDefaultBoxOpacity),
                            child: Text(
                              "Image not found.",
                              style: kNavTextStyle.copyWith(fontSize: 18),
                            ),
                          ),
                    ElevatedButton(
                      style: invisibleButton().copyWith(
                        overlayColor: MaterialStateProperty.resolveWith((_) =>
                            Colors.black.withOpacity(kDefaultBoxOpacity)),
                      ),
                      onPressed: () {
                        Overlay.of(context)
                            .insert(_imageOverlay(snapshot.data));
                      },
                      child: Container(),
                    ),
                  ],
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  child: CircularProgressIndicator(),
                );
              }

              return Container(
                child: Text("An unknown error has occured"),
              );
            }),
      ],
    );
  }

  String _getCurrentUser() {
    User user = FirebaseAuth.instance.currentUser;
    if (user.isAnonymous) {
      return anonymousUser;
    } else {
      return user.uid;
    }
  }

  Future _loadImage(Reference ref) async {
    await ref.getDownloadURL().then((url) {
      // This is not a real error -> It works when built but incorrectly
      // displaying this error is a known issue of dart:ui
      // ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(ref.fullPath.toString(), (_) {
        return ImageElement()..src = url;
      });
    });

    return HtmlElementView(
      viewType: ref.fullPath.toString(),
    );
  }

  OverlayEntry _imageOverlay(HtmlElementView htmlImage) {
    OverlayEntry overlay;
    if (htmlImage != null) {
      // Scale htmlImage to size that fits the screen
      while ((this.heightMap[this.imageName] >
              MediaQuery.of(context).size.height) ||
          (this.widthMap[this.imageName] > MediaQuery.of(context).size.width)) {
        this.heightMap[this.imageName] /= 1.1;
        this.widthMap[this.imageName] /= 1.1;
      }
    } else {
      // Set size of 'Image not found' container
      this.widthMap[this.imageName] = MediaQuery.of(context).size.width / 3;
      this.heightMap[this.imageName] = MediaQuery.of(context).size.height / 3;
    }

    overlay = OverlayEntry(builder: (context) {
      return Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            color: Colors.black.withOpacity(kDefaultBoxOpacity),
          ),
          Positioned(
            left: (MediaQuery.of(context).size.width -
                    this.widthMap[this.imageName]) /
                2,
            top: (MediaQuery.of(context).size.height -
                    this.heightMap[this.imageName]) /
                2,
            width: this.widthMap[this.imageName],
            height: this.heightMap[this.imageName],
            child: htmlImage != null
                ? htmlImage
                : Container(
                    alignment: Alignment.center,
                    color: Theme.of(context).colorScheme.secondary,
                    child: Text(
                      "Image not found.",
                      style: kNavTextStyle.copyWith(fontSize: 18),
                    ),
                  ),
          ),
          ElevatedButton(
            style: invisibleButton(),
            child: Container(),
            onPressed: () {
              overlay.remove();
            },
          ),
        ],
      );
    });

    return overlay;
  }
}
