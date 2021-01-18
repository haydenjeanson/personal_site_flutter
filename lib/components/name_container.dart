import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:personal_site_flutter/components/background_box.dart';
import 'package:personal_site_flutter/constants.dart';
import 'package:personal_site_flutter/screens/welcome_screen.dart';
import 'package:personal_site_flutter/util.dart';

class NameContainer extends StatefulWidget {
  final String text;
  final double opacity;

  const NameContainer({@required this.text, this.opacity = 0.75});

  @override
  _NameContainerState createState() =>
      _NameContainerState(text: this.text, opacity: this.opacity);
}

class _NameContainerState extends State<NameContainer> {
  final String text;
  final double opacity;

  AssetImage _imageToShow = new AssetImage("images/welcome_screen/hayden.png");

  _NameContainerState({@required this.text, this.opacity = kDefaultBoxOpacity});

  void updateImage() {
    setState(() {
      _imageToShow = new AssetImage("images/welcome_screen/hayden.png");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: kNameHeroTag,
      child: ElevatedButton(
        onPressed: () {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            Navigator.pushNamed(context, WelcomeScreen.kID);
          });
        },
        style: invisibleButton(),
        child: BackgroundBox(
          opacity: this.opacity,
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
                        this.text,
                        style: kNavTextStyle,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                    ),
                    image: new DecorationImage(
                        alignment: Alignment.topCenter,
                        image: _imageToShow,
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
