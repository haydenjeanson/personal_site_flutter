import 'package:flutter/material.dart';
import 'package:personal_site_flutter/components/background.dart';
import 'package:personal_site_flutter/components/name_container.dart';
import 'package:personal_site_flutter/components/sidebar.dart';
import 'package:personal_site_flutter/constants.dart';
import 'package:personal_site_flutter/shopify_image_repo/components/sign_in.dart';
import 'package:personal_site_flutter/shopify_image_repo/screens/signed_in_image_repo.dart';

class ShopifyImageRepo extends StatefulWidget {
  static const kID = 'shopify_image_repo_home';

  @override
  _ShopifyImageRepoState createState() => _ShopifyImageRepoState();
}

class _ShopifyImageRepoState extends State<ShopifyImageRepo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Background(
          foregroundDecoration: BoxDecoration(
            backgroundBlendMode: BlendMode.saturation,
            color: Colors.grey,
          ),
        ),
        Positioned(
          height: MediaQuery.of(context).size.height * kHeaderHeightMultiplier,
          width: MediaQuery.of(context).size.width * kHeaderWidthMultiplier,
          left: ((MediaQuery.of(context).size.width) -
                  (MediaQuery.of(context).size.width *
                      kHeaderWidthMultiplier)) /
              2,
          top: 0,
          child: NameContainer(
            text: 'Hayden Jeanson',
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: SignIn(
            routeOnAuth: SignedInImageRepo.kID,
          ),
        ),
        Sidebar(
          githubUrl:
              'https://github.com/haydenjeanson/personal_site_flutter/tree/master/lib/shopify_image_repo',
        ),
      ]),
    );
  }
}
