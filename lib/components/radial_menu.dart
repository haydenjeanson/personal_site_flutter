import 'package:flutter/material.dart';
import 'dart:math';
import 'package:personal_site_flutter/contants.dart';

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
    return Positioned(
      left: -(MediaQuery.of(context).size.width / 3),
      child: Container(
        child: RadialAnimation(controller: controller),
      ),
    );
  }
}

class RadialAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> boxScale;
  final Animation<double> rotation;

  static const double kScaleMax = 2.0;
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
              1.0, // 0, 0.7: Start right away, end at 70% into the animation
              curve: Curves.decelerate,
            ),
          ),
        ),
        super(key: key);

  build(context) {
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
                    color: Colors.pink, text: 'Home'),
                _buildButton(context, 11 * pi / 6, // 0 is east
                    color: Colors.red,
                    text: 'About Me'),
                _buildButton(context, pi / 6,
                    color: Colors.green, text: 'Projects'),
                _buildButton(context, pi / 2,
                    color: Colors.orange, text: "Contact Me"),
                Transform.scale(
                  scale: scale.value - kScaleMax,
                  child: FloatingActionButton(
                    onPressed: _close,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: Icon(
                      Icons.cancel,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ),
                Transform.scale(
                  scale: scale.value,
                  child: FloatingActionButton(
                    onPressed: _open,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Icon(
                      Icons.apps,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // angle (radians)
  _buildButton(context, double angle, {Color color, String text}) {
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
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          minimumSize: Size(
            MediaQuery.of(context).size.width / 8,
            MediaQuery.of(context).size.height / 24,
          ),
        ),
        child: Text(text, style: kNavTextStyle),
        onPressed: () {
          print("hello");
          _close();
        },
      ),
    );
  }

  _open() {
    controller.forward();
  }

  _close() {
    controller.reverse();
  }
}
