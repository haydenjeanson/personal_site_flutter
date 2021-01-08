import "package:flutter/material.dart";
import 'package:personal_site_flutter/components/about_me/fav_activity_1.dart';
import 'package:personal_site_flutter/components/about_me/fav_activity_2.dart';
import 'package:personal_site_flutter/components/about_me/fav_activity_3.dart';
import 'package:personal_site_flutter/components/animated_box.dart';
import 'package:personal_site_flutter/components/background.dart';
import 'package:personal_site_flutter/components/github_button.dart';
import 'package:personal_site_flutter/components/linkedin_button.dart';
import 'package:personal_site_flutter/components/name_container.dart';
import 'package:personal_site_flutter/components/radial_menu.dart';
import 'package:personal_site_flutter/components/sidebar.dart';
import 'package:personal_site_flutter/constants.dart';

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
            child: ListView(
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 8,
                      height: 20,
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AnimatedBox(
                          colour: Theme.of(context).colorScheme.secondary,
                          opacity: this.opacity,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Wrap(
                              children: [
                                Text(
                                  "Hi, and welcome to my site! I'm a fourth year BSc computer science student at Wilfrid Laurier University. I have a passion for software development, and I love to solve difficult problems. Recently, some of my favorite programming related activities have been: ",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      fontSize: 25),
                                ),
                                FavActivity1(),
                                _ActivityDivider(),
                                FavActivity2(),
                                _ActivityDivider(),
                                FavActivity3(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Sidebar(),
        ],
      ),
    );
  }
}

class _ActivityDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0,
      indent: MediaQuery.of(context).size.width / 3,
      endIndent: MediaQuery.of(context).size.width / 3,
    );
  }
}
