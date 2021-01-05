import 'package:flutter/material.dart';
import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return RadialAnimation(controller: controller);
  }
}

class RadialAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> translation;
  final Animation<double> rotation;

  RadialAnimation({Key key, this.controller})
      : scale = Tween<double>(
          begin: 1.5,
          end: 0.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.fastOutSlowIn,
          ),
        ),
        translation = Tween<double>(
          begin: 0.0,
          end: 100.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.easeInCirc,
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
          child: Stack(
            alignment: Alignment.center,
            children: [
              _buildButton(0, // 0 is east
                  color: Colors.red,
                  icon: FontAwesomeIcons.thumbtack),
              _buildButton(pi / 4,
                  color: Colors.green, icon: FontAwesomeIcons.sprayCan),
              _buildButton(pi / 2,
                  color: Colors.orange, icon: FontAwesomeIcons.fire),
              _buildButton(3 * pi / 2,
                  color: Colors.pink, icon: FontAwesomeIcons.bong),
              _buildButton(7 * pi / 4,
                  color: Colors.yellow, icon: FontAwesomeIcons.bolt),
              Transform.scale(
                scale: scale.value - 1.5,
                child: FloatingActionButton(
                    onPressed: _close,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: Icon(FontAwesomeIcons.timesCircle)),
              ),
              Transform.scale(
                scale: scale.value,
                child: FloatingActionButton(
                  onPressed: _open,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  child: Icon(FontAwesomeIcons.solidDotCircle),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // angle (radians)
  _buildButton(double angle, {Color color, IconData icon}) {
    return Transform(
      transform: Matrix4.identity()
        ..translate(
          (translation.value) * cos(angle),
          (translation.value) * sin(angle),
        ),
      child: FloatingActionButton(
        child: Icon(icon),
        backgroundColor: color,
        onPressed: _close,
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
