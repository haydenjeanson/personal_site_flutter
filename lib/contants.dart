import 'package:flutter/cupertino.dart';

import "package:flutter/material.dart";

const TextStyle kNavTextStyle = TextStyle(
  color: Colors.black,
  fontFamily: 'AlegreyaSans',
  decoration: TextDecoration.none,
  fontWeight: FontWeight.normal,
);

const String kNameHeroTag = 'name';

const ColorScheme kMainColourScheme = ColorScheme(
  background: Color(0xFFE64A19),
  brightness: Brightness.light,
  error: Colors.red,
  onError: Colors.black,
  onBackground: Color(0xFFFFC107),
  onPrimary: Color(0xFF1A1A1A),
  onSecondary: Color(0xFF757575),
  primary: Color(0xFFFF5722),
  primaryVariant: Color(0xFF772106),
  secondary: Color(0xFFFFCCBC),
  secondaryVariant: Color(0xFFCC7C64),
  surface: Color(0xFFBDBDBD),
  onSurface: Colors.black,
);

const double kDefaultBoxOpacity = 0.5;

const double kHeaderHeightMultiplier = 1 / 6;
const double kHeaderWidthMultiplier = 3 / 8;
