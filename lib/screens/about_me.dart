import "package:flutter/material.dart";
import 'package:personal_site_flutter/components/animated_box.dart';
import 'package:personal_site_flutter/components/background.dart';
import 'package:personal_site_flutter/components/background_box.dart';
import 'package:personal_site_flutter/components/name_container.dart';
import 'package:personal_site_flutter/components/radial_menu.dart';
import 'package:personal_site_flutter/contants.dart';

class AboutMe extends StatefulWidget {
  static const String kID = "about_me";

  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  final double opacity = 0.75;

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
              opacity: this.opacity,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * kHeaderHeightMultiplier,
            height: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).size.height * kHeaderHeightMultiplier),
            width: MediaQuery.of(context).size.width,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedBox(
                  colour: Theme.of(context).colorScheme.secondaryVariant,
                  opacity: this.opacity,
                )),
          ),
          Positioned(
            left: -(MediaQuery.of(context).size.width / 3),
            child: RadialMenu(),
          ),
        ],
      ),
    );
  }
}
