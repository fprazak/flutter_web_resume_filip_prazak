import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SizedBoxIconsAbout extends StatelessWidget {
  final String assetUrl;
  final String launchUrl;

  SizedBoxIconsAbout(this.assetUrl, this.launchUrl);

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget build(context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Color.fromRGBO(52, 58, 64, 1),
          shape: CircleBorder(),
        ),
        child: IconButton(
            iconSize: 20,
            color: Color.fromRGBO(205, 55, 0, 1),
            onPressed: () {
              _launchInBrowser(launchUrl);
            },
            icon: Image.asset(assetUrl)),
        onPressed: () {
          _launchInBrowser(launchUrl);
        },
      ),
    );
  }
}
