import 'package:flutter/material.dart';
import 'package:personal_site_flutter/contants.dart';

class NameContainer extends StatelessWidget {
  final String text;

  const NameContainer({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: kNameHeroTag,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8.0)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: FittedBox(
                    child: Text(
                      text,
                      style: kNavTextStyle,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0)),
                child: Image.asset("images/welcome_screen/hayden.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
