import 'package:flutter/material.dart';
import 'package:responsive_image/responsive_image.dart';

class Background extends StatelessWidget {
  final BoxDecoration foregroundDecoration;

  const Background({this.foregroundDecoration = const BoxDecoration()});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'background',
      child: Container(
        foregroundDecoration: this.foregroundDecoration,
        child: ResponsiveImage(
          srcSet: {
            2560: "images/welcome_screen/wallpaper-2560.jpg",
            1280: "images/welcome_screen/wallpaper-1280.jpg",
            320: "images/welcome_screen/wallpaper-640.jpg",
          },
          builder: (BuildContext context, String src) {
            return Image.asset(
              src,
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            );
          },
        ),
      ),
    );
  }
}
