import 'package:url_launcher/url_launcher.dart';

class Util {
  static void launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Error(Util.launchURL): Could not launch $url';
    }
  }
}
