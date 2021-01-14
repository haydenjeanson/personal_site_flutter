import 'package:flutter/material.dart';

class BodyWidget extends StatelessWidget {
  final Widget child;

  const BodyWidget({@required this.child});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 8,
              height: 20,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: this.child,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
