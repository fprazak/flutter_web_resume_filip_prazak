import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SizedBoxIconsAbout extends StatelessWidget {
  final String assetUrl;
  final String launchUrl;

  const SizedBoxIconsAbout(this.assetUrl, this.launchUrl, {Key? key}) : super(key: key);

  Future<void> _launchInBrowser(String url) async {
    if (!await canLaunch(url)) return;

    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    );
  }

  @override
  Widget build(context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: const Color.fromRGBO(52, 58, 64, 1),
          shape: const CircleBorder(),
        ),
        child: IconButton(
            iconSize: 20,
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
