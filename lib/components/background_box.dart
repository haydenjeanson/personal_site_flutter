import 'package:flutter/material.dart';
import 'package:personal_site_flutter/contants.dart';

class BackgroundBox extends StatelessWidget {
  final double opacity;
  final Widget child;

  const BackgroundBox(
      {this.opacity = kDefaultBoxOpacity, @required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context)
              .colorScheme
              .background
              .withOpacity(this.opacity),
          borderRadius: BorderRadius.circular(8.0)),
      child: this.child,
    );
  }
}
