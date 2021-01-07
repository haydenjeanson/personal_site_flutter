import 'package:flutter/material.dart';
import 'package:personal_site_flutter/constants.dart';

class FavActivity2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: kLineSpacing, left: kIndentDistance),
          child: Text(
            "2) Advent of Code (AOC) 2020. Although I have not yet had the time to complete all of it, AOC has been a blast so far! Some Takeaways:",
            style: kParagraphTextStyle,
          ),
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
                "• Coding challenges are a lot of fun!",
                style: kParagraphTextStyle,
              ),
              Text(
                "• On difficult problems, it helps a lot to reason with pen and paper or a whiteboard prior to coding.",
                style: kParagraphTextStyle,
              ),
              Text(
                "• I learn data structures and algorithms best by practicing! I had to relearn a lot of old concepts (like pathing algorithms), but I understand them a lot better now.",
                style: kParagraphTextStyle,
              ),
            ],
          ),
        )
      ],
    );
  }
}
