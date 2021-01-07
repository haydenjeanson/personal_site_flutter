import 'package:flutter/material.dart';
import 'package:personal_site_flutter/constants.dart';

class FavActivity1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kLineSpacing, left: kIndentDistance),
      child: Wrap(
        children: [
          Text(
            "1) Building this site! This site is built using flutter, and I think it's really cool that it would work the same whether I ran it as an app or webpage! This site has given me a chance to use these skills:",
            style: kParagraphTextStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: kLineSpacing, bottom: kLineSpacing, left: kIndentDistance),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "• Modular programming",
                  style: kParagraphTextStyle,
                ),
                Text(
                  "• Knowledge of the flutter framework and dart",
                  style: kParagraphTextStyle,
                ),
                Text(
                  "• Version control with Git",
                  style: kParagraphTextStyle,
                ),
                Text(
                  "• Publishing a website: I'm using GitHub Pages and Namecheap",
                  style: kParagraphTextStyle,
                ),
                Text(
                  "• Soft skills such as: Problem solving, creativity, time management",
                  style: kParagraphTextStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
