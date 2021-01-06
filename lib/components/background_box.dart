import 'package:flutter/material.dart';
import 'package:personal_site_flutter/contants.dart';

// ignore: must_be_immutable
class BackgroundBox extends StatelessWidget {
  final double opacity;
  final Widget child;
  Color colour;

  BackgroundBox(
      {this.opacity = kDefaultBoxOpacity, @required this.child, this.colour}) {
    if (this.colour == null) {
      this.colour = kMainColourScheme.background;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: this.colour.withOpacity(this.opacity),
          borderRadius: BorderRadius.circular(8.0)),
      child: this.child,
    );
  }
}
