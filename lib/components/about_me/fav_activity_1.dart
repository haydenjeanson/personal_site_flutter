import 'package:flutter/material.dart';
import 'package:personal_site_flutter/constants.dart';

class FavActivity1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: kLineSpacing, left: kIndentDistance),
          child: Text(
            "1) My software engineering course group project: This was a React Native mobile app designed to find nearby bus stops and routes in the GRT transit system. I learned about:",
            style: kParagraphTextStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: kLineSpacing, left: kIndentDistance * 2),
          child: Wrap(
            spacing: kIndentDistance,
            children: [
              Text(
                "• the group development process",
                style: kParagraphTextStyle,
              ),
              Text(
                "• the Google Maps API",
                style: kParagraphTextStyle,
              ),
              Text(
                "• React Native development",
                style: kParagraphTextStyle,
              ),
            ],
          ),
        )
      ],
    );
  }
}
