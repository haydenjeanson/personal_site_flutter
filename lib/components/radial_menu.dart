import 'package:flutter/material.dart';
import 'dart:math';
import 'package:personal_site_flutter/constants.dart';
import 'package:personal_site_flutter/screens/about_me.dart';
import 'package:personal_site_flutter/screens/contact_me.dart';
import 'package:personal_site_flutter/screens/projects.dart';
import 'package:personal_site_flutter/screens/welcome_screen.dart';
import 'package:responsive_image/responsive_image.dart';

class RadialMenu extends StatefulWidget {
  @override
  _RadialMenuState createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 900), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RadialAnimation(controller: controller),
    );
  }

  @override
  void dispose() {
    this.controller.dispose();
    super.dispose();
  }
}

class RadialAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> boxScale;
  final Animation<double> rotation;

  static const double kScaleMax = 1.5;
  static const double kMenuExpansion = 150;

  RadialAnimation({Key key, this.controller})
      : scale = Tween<double>(
          begin: kScaleMax,
          end: 0.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.fastOutSlowIn,
          ),
        ),
        boxScale = Tween<double>(
          begin: 0,
          end: 0.5,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.fastOutSlowIn,
          ),
        ),
        rotation = Tween<double>(
          begin: 0.0,
          end: 2 * pi,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.3,
              1.0,
              curve: Curves.decelerate,
            ),
          ),
        ),
        super(key: key);

  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, builder) {
        return Transform.rotate(
          angle: rotation.value,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 5 / 6,
            child: Stack(
              alignment: Alignment.center,
              children: [
                _buildButton(context, 3 * pi / 2,
                    color: Colors.pink,
                    text: 'Home',
                    routeName: WelcomeScreen.kID),
                _buildButton(context, 11 * pi / 6,
                    color: Colors.red,
                    text: 'About Me',
                    routeName: AboutMe.kID),
                _buildButton(context, pi / 6,
                    color: Colors.green,
                    text: 'Projects',
                    routeName: Projects.kID),
                _buildButton(context, pi / 2,
                    color: Colors.orange,
                    text: 'Contact Me',
                    routeName: ContactMe.kID),
                Transform.scale(
                  scale: scale.value - kScaleMax,
                  child: _buildFab(context, "cancel", 'close_button',
                      Theme.of(context).colorScheme.secondary, _close),
                ),
                Transform.scale(
                  scale: scale.value,
                  child: _buildFab(context, "apps", 'open_button',
                      Theme.of(context).colorScheme.primary, _open),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Container _buildFab(BuildContext context, String iconName, String heroTag,
      Color backgroundColour, Function onPressed) {
    double buttonWidth = MediaQuery.of(context).size.height / 8;
    double buttonHeight = MediaQuery.of(context).size.height / 10;

    return Container(
      height: buttonHeight,
      width: buttonWidth,
      child: FittedBox(
        child: FloatingActionButton(
          heroTag: heroTag,
          onPressed: onPressed,
          backgroundColor: backgroundColour,
          hoverColor: Colors.black.withOpacity(0.2),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ResponsiveImage(
              srcSet: {
                18: 'images/$iconName-icon-18dp.png',
                24: 'images/$iconName-icon-24dp.png',
                36: 'images/$iconName-icon-36dp.png',
                48: 'images/$iconName-icon-48dp.png',
              },
              builder: (context, src) {
                return Image.asset(src);
              },
            ),
          ),
        ),
      ),
    );
  }

  Transform _buildButton(BuildContext context, double angle,
      {Color color, String text, String routeName}) {
    Animation<double> translation = Tween<double>(
      begin: 0.0,
      end: MediaQuery.of(context).size.width / 9,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInCirc,
      ),
    );

    double offsetAmount = MediaQuery.of(context).size.width / 15;

    return Transform(
      transform: Matrix4.identity()
        ..translate(offsetAmount)
        ..translate(
          (translation.value) * cos(angle),
          (translation.value) * sin(angle),
        )
        ..scale(-(scale.value - kScaleMax)),
      child: Hero(
        tag: routeName,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            minimumSize: Size(
              MediaQuery.of(context).size.width / 8,
              MediaQuery.of(context).size.height * 2 / 30,
            ),
          ),
          child: Text(text, style: kNavTextStyle.copyWith(fontSize: 30)),
          onPressed: () {
            _close();
            if (ModalRoute.of(context).settings.name != routeName) {
              Navigator.pushNamed(context, routeName);
            }
          },
        ),
      ),
    );
  }

  void _open() {
    controller.forward();
  }

  void _close() {
    controller.reverse();
  }
}
