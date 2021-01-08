import 'package:flutter/material.dart';
import 'package:personal_site_flutter/components/github_button.dart';
import 'package:personal_site_flutter/constants.dart';

class FavActivity3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Row(
          children: [
            GithubButton(url: 'https://github.com/danwardvs/cp317final'),
            Flexible(
              child: Text(
                "3) My software engineering course group project: This was a React Native mobile app designed to find nearby bus stops and routes in the GRT transit system. I learned about:",
                style: kParagraphTextStyle,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: kLineSpacing,
              bottom: kLineSpacing,
              left: kIndentDistance * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
