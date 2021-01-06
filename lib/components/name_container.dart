import 'package:flutter/material.dart';
import 'package:personal_site_flutter/contants.dart';

class NameContainer extends StatefulWidget {
  @override
  _NameContainerState createState() => _NameContainerState();
}

class _NameContainerState extends State<NameContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8.0)),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: FittedBox(
                child: Text(
                  "Hayden\n    Jeanson",
                  style: kNavTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerRight,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0)),
                child: Image.asset("images/welcome_screen/hayden.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
