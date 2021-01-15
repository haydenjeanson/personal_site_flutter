import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:personal_site_flutter/components/about_me/fav_activity_1.dart';
import 'package:personal_site_flutter/components/about_me/fav_activity_2.dart';
import 'package:personal_site_flutter/components/about_me/fav_activity_3.dart';
import 'package:personal_site_flutter/components/animated_box.dart';
import 'package:personal_site_flutter/components/background.dart';
import 'package:personal_site_flutter/components/body_widget.dart';
import 'package:personal_site_flutter/components/name_container.dart';
import 'package:personal_site_flutter/components/sidebar.dart';
import 'package:personal_site_flutter/constants.dart';
import 'package:personal_site_flutter/screens/projects.dart';

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
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * kHeaderHeightMultiplier,
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).size.height *
                      kHeaderHeightMultiplier),
              width: MediaQuery.of(context).size.width,
              child: BodyWidget(
                child: AnimatedBox(
                  colour: Theme.of(context).colorScheme.secondary,
                  opacity: this.opacity,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Wrap(
                      children: [
                        RichText(
                            text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  "Hi, and welcome to my site! I'm a fourth year BSc computer science student at Wilfrid Laurier University. I have a passion for software development, and I love to solve difficult problems. You can find some of my favourite recent programming related activities below. All of these and more can be also be found on my ",
                              style: kParagraphTextStyle,
                            ),
                            TextSpan(
                              text: "projects",
                              style: kParagraphTextStyle.copyWith(
                                decoration: TextDecoration.underline,
                                color: kLinkColour,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, Projects.kID);
                                },
                            ),
                            TextSpan(
                              text: " page.",
                              style: kParagraphTextStyle,
                            ),
                          ],
                        )),
                        FavActivity1(),
                        _ActivityDivider(),
                        FavActivity2(),
                        _ActivityDivider(),
                        FavActivity3(),
                        _ActivityDivider(),
                        Text(
                          "Outside of coding, I love to spend time with my girlfriend and play a variety of games. My favourite games are Valorant and Magic: the Gathering, but my friends and I play a variety of games that tend to change week to week.",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
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
      height: kIndentDistance,
      indent: MediaQuery.of(context).size.width / 3,
      endIndent: MediaQuery.of(context).size.width / 3,
    );
  }
}
