import 'package:flutter/material.dart';
import 'package:personal_site_flutter/components/github_button.dart';
import 'package:personal_site_flutter/components/linkedin_button.dart';
import 'package:personal_site_flutter/components/radial_menu.dart';
import 'package:personal_site_flutter/constants.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    final double radialDistance =
        (MediaQuery.of(context).size.width * kRadialMenuDistance);
    final double buttonHeight = MediaQuery.of(context).size.height / 7;
    final double buttonWidth = MediaQuery.of(context).size.width / 9;

    return Stack(
      children: [
        Positioned(
          left: 0,
          top: MediaQuery.of(context).size.height / 4,
          height: buttonHeight,
          width: buttonWidth,
          child: Hero(
            tag: 'nav_github',
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: GithubButton(url: 'https://github.com/haydenjeanson'),
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: MediaQuery.of(context).size.height / 4,
          height: buttonHeight,
          width: buttonWidth,
          child: Hero(
            tag: 'nav_linkedin',
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: LinkedinButton(
                    url: 'https://www.linkedin.com/in/hayden-jeanson/'),
              ),
            ),
          ),
        ),
        Positioned(
          right: radialDistance,
          child: RadialMenu(),
        ),
      ],
    );
  }
}