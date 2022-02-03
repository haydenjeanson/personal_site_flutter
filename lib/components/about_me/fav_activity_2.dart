import 'package:flutter/material.dart';
import 'package:personal_site_flutter/components/github_button.dart';
import 'package:personal_site_flutter/constants.dart';

class FavActivity2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Row(
          children: [
            GithubButton(
                url: 'https://github.com/haydenjeanson/AdventOfCode2020'),
            Flexible(
              child: Text(
                "2) Kovaak Stat Reader. This python desktop application preprocesses and graphs score data for scenarios in the aim training game KovaaK's. ",
                style: kParagraphTextStyle,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: kLineSpacing, left: kIndentDistance * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "• Pandas used for reading KovaaK's csv files and preprocessing done in a Pandas dataframe.",
                style: kParagraphTextStyle,
              ),
              Text(
                "• Matplotlib used to graph the Pandas dataframes, showing how the users score changes over time.",
                style: kParagraphTextStyle,
              ),
              Text(
                "• Jupyter Notebook used for prototyping.",
                style: kParagraphTextStyle,
              ),
            ],
          ),
        )
      ],
    );
  }
}
