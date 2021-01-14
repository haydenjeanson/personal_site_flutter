import 'package:flutter/material.dart';
import 'package:personal_site_flutter/components/background_box.dart';
import 'package:personal_site_flutter/constants.dart';

class AnimatedBox extends StatefulWidget {
  final Color colour;
  final double opacity;
  final Widget child;

  AnimatedBox(
      {this.colour = kBackgroundColour,
      this.opacity = kDefaultBoxOpacity,
      this.child});

  @override
  _AnimatedBoxState createState() => _AnimatedBoxState(
      colour: this.colour, opacity: this.opacity, child: this.child);
}

class _AnimatedBoxState extends State<AnimatedBox>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  final Color colour;
  final double opacity;
  final Widget child;

  _AnimatedBoxState({this.colour, this.opacity, this.child});

  @override
  void initState() {
    super.initState();
    this.controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    this.controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BoxAnimation(
        controller: this.controller,
        colour: this.colour,
        opacity: this.opacity,
        child: this.child,
      ),
    );
  }

  @override
  void dispose() {
    this.controller.dispose();
    super.dispose();
  }
}

class BoxAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> xScale;

  final Color colour;
  final double opacity;
  final Widget child;

  static const double scaleMax = 1.0;

  BoxAnimation(
      {Key key,
      this.controller,
      this.colour,
      this.opacity = kDefaultBoxOpacity,
      this.child})
      : xScale = Tween<double>(
          begin: 0.0,
          end: scaleMax,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.fastOutSlowIn,
          ),
        ),
        super(key: key);

  build(context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, builder) {
        return Transform.scale(
            scale: xScale.value,
            child: BackgroundBox(
              colour: this.colour,
              opacity: this.opacity,
              child: this.child,
            ));
      },
    );
  }
}
