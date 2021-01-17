import 'package:flutter/cupertino.dart';

import "package:flutter/material.dart";

const TextStyle kNavTextStyle = TextStyle(
  color: _kOnSurfaceColour,
  fontFamily: 'AlegreyaSans',
  decoration: TextDecoration.none,
  fontWeight: FontWeight.normal,
);

const TextStyle kParagraphTextStyle =
    TextStyle(color: _kOnSurfaceColour, fontSize: 25);

const String kNameHeroTag = 'name';

const Color kBackgroundColour = const Color(0xFFE64A19);
const Color _kErrorColour = const Color(0xFFFF0000);
const Color _kOnErrorColour = const Color(0xFF000000);
const Color _kOnBackgroundColour = const Color(0xFFFFBF00);
const Color _kOnPrimaryColour = const Color(0xFF1A1A1A);
const Color _kOnSecondaryColour = const Color(0xFF757575);
const Color _kPrimaryColour = const Color(0xFFFF5722);
const Color _kPrimaryVariantColour = const Color(0xFF772106);
const Color kSecondaryColour = const Color(0xFFFFCCBC);
const Color _kSecondaryVariantColour = const Color(0xFFCC7C64);
const Color _kSurfaceColour = const Color(0xFFBDBDBD);
const Color _kOnSurfaceColour = const Color(0xFF000000);

const ColorScheme kMainColourScheme = const ColorScheme(
  background: kBackgroundColour,
  brightness: Brightness.light,
  error: _kErrorColour,
  onError: _kOnErrorColour,
  onBackground: _kOnBackgroundColour,
  onPrimary: _kOnPrimaryColour,
  onSecondary: _kOnSecondaryColour,
  primary: _kPrimaryColour,
  primaryVariant: _kPrimaryVariantColour,
  secondary: kSecondaryColour,
  secondaryVariant: _kSecondaryVariantColour,
  surface: _kSurfaceColour,
  onSurface: _kOnSurfaceColour,
);

const Color kLinkColour = const Color(0xFF031C31);

const double kDefaultBoxOpacity = 0.5;

const double kHeaderHeightMultiplier = 1 / 6;
const double kHeaderWidthMultiplier = 3 / 8;
const double kRadialMenuDistance = 52 / 100;
const double kIndentDistance = 50.0;
const double kLineSpacing = 12.5;

const String kAnonymousUser = 'anonymous';
