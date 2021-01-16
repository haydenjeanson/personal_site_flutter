import 'dart:async';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:personal_site_flutter/constants.dart';
import 'package:personal_site_flutter/util.dart';

class FirebaseImage extends StatefulWidget {
  final Reference image;

  FirebaseImage(this.image);

  @override
  _FirebaseImageState createState() => _FirebaseImageState(this.image);
}

class _FirebaseImageState extends State<FirebaseImage> {
  final Reference image;
  _FirebaseImageState(this.image);

  FirebaseStorage storage = FirebaseStorage.instance;

  // 100 is an abitrary number > 0 so that something still appears if it errors
  double naturalWidth = 100;
  double naturalHeight = 100;

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

  Future _loadImage(Reference ref) async {
    await ref.getDownloadURL().then((url) {
      // This is not a real error -> It works when built but incorrectly
      // displaying this error is a known issue of dart:ui
      // ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(image.toString(), (_) {
        ImageElement img = ImageElement()..src = url;

        this.naturalWidth = (img.naturalWidth) as double;
        this.naturalHeight = (img.naturalHeight) as double;

        return img;
      });
    });

    return HtmlElementView(
      viewType: image.toString(),
    );
  }

  OverlayEntry _imageOverlay(HtmlElementView image) {
    OverlayEntry overlay;
    if (image != null) {
      // Scale image to size that fits the screen
      while ((this.naturalHeight > MediaQuery.of(context).size.height) ||
          (this.naturalWidth > MediaQuery.of(context).size.width)) {
        this.naturalHeight /= 1.1;
        this.naturalWidth /= 1.1;
      }
    } else {
      // Set size of Image not found container
      this.naturalWidth = MediaQuery.of(context).size.width / 3;
      this.naturalHeight = MediaQuery.of(context).size.height / 3;
    }

    overlay = OverlayEntry(builder: (context) {
      return Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            color: Colors.black.withOpacity(kDefaultBoxOpacity),
          ),
          Positioned(
            left: (MediaQuery.of(context).size.width - this.naturalWidth) / 2,
            top: (MediaQuery.of(context).size.height - this.naturalHeight) / 2,
            width: this.naturalWidth,
            height: this.naturalHeight,
            child: image != null
                ? image
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
