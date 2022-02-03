import 'package:flutter/material.dart';
import 'package:personal_site_flutter/components/animated_box.dart';
import 'package:personal_site_flutter/components/background.dart';
import 'package:personal_site_flutter/components/name_container.dart';
import 'package:personal_site_flutter/components/project_box.dart';
import 'package:personal_site_flutter/components/sidebar.dart';
import 'package:personal_site_flutter/constants.dart';
import 'package:personal_site_flutter/shopify_image_repo/screens/shopify_image_repo.dart';
import 'package:personal_site_flutter/util.dart';

class Projects extends StatefulWidget {
  static const String kID = 'projects';

  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    double leftWidth = MediaQuery.of(context).size.width * kLeftWidthMultiplier;

    return Scaffold(
      body: Stack(children: [
        Background(
          foregroundDecoration: BoxDecoration(
            backgroundBlendMode: BlendMode.saturation,
            color: Colors.grey,
          ),
        ),
        Positioned(
          height: MediaQuery.of(context).size.height * kHeaderHeightMultiplier,
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
          child: Row(
            children: [
              Container(
                width: leftWidth - kDefaultPad,
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(kDefaultPad),
                child: AnimatedBox(
                  child: Container(
                    constraints: BoxConstraints.tight(Size(
                        MediaQuery.of(context).size.width -
                            leftWidth -
                            kDefaultPad,
                        MediaQuery.of(context).size.height -
                            (MediaQuery.of(context).size.height *
                                kHeaderHeightMultiplier))),
                    child: Padding(
                      padding: const EdgeInsets.all(kDefaultPad),
                      child: GridView.count(
                        crossAxisSpacing: 5.0,
                        crossAxisCount: (((MediaQuery.of(context).size.width -
                                        leftWidth -
                                        (kDefaultPad * 2)) ~/
                                    300) <
                                1)
                            ? 1
                            : ((MediaQuery.of(context).size.width -
                                    leftWidth -
                                    (kDefaultPad * 2)) ~/
                                300),
                        children: [
                          ProjectBox(
                            imagePath: 'images/camera.jpg',
                            label: 'Image Repository',
                            onPressed: () => Navigator.pushReplacementNamed(
                                context, ShopifyImageRepo.kID),
                          ),
                          ProjectBox(
                            imagePath: 'images/you_are_here.jpg',
                            label: 'This Website!',
                            onPressed: () => Util.launchURL(
                                'https://github.com/haydenjeanson/personal_site_flutter'),
                          ),
                          ProjectBox(
                            imagePath: 'images/advent_of_code.jpg',
                            label: 'Advent of Code 2020',
                            onPressed: () => Util.launchURL(
                                'https://github.com/haydenjeanson/AdventOfCode2020'),
                          ),
                          ProjectBox(
                            imagePath: 'images/route_locator.png',
                            label: 'GRT Route Locator (CP317 Group Project)',
                            onPressed: () => Util.launchURL(
                                'https://github.com/danwardvs/cp317final'),
                          ),
                          ProjectBox(
                            imagePath: 'images/discord_bot.jpg',
                            label: '5 Guys Discord Bot',
                            onPressed: () => Util.launchURL(
                                'https://github.com/haydenjeanson/5GuysBot'),
                          ),
                          ProjectBox(
                            imagePath: 'images/kovaaks_logo.jpg',
                            label: 'KovaaK\'s Stat Reader',
                            onPressed: () => Util.launchURL(
                                'https://github.com/haydenjeanson/KovaakStatReader'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Sidebar(),
      ]),
    );
  }
}
