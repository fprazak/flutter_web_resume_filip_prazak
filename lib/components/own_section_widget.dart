import 'package:flutter/cupertino.dart';

class OwnSectionsWidget extends StatelessWidget {
  final Widget body;
  OwnSectionsWidget(this.body);

  Widget build(context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width * 0.02;
    final mediaQueryHeight = MediaQuery.of(context).size.height * 0.2;
    return Padding(
      padding: EdgeInsets.only(
          left: mediaQueryWidth, right: mediaQueryWidth, bottom: mediaQueryHeight, top: mediaQueryHeight),
      child: body,
    );
  }
}
