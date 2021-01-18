import 'package:flutter/material.dart';
import 'package:personal_site_flutter/constants.dart';

class ProjectBox extends StatelessWidget {
  final Function onPressed;
  final String label;
  final String imagePath;

  const ProjectBox(
      {Key key, this.onPressed, this.label, @required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => Theme.of(context).colorScheme.secondary)),
            onPressed: this.onPressed == null ? () {} : this.onPressed,
            child: Image.asset(
              this.imagePath,
              width: 250,
              height: 250,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: this.onPressed == null ? () {} : this.onPressed,
            child: Container(
              child: Text(this.label == null ? '' : this.label,
                  style: kNavTextStyle),
            ),
          ),
        ),
      ],
    );
  }
}
