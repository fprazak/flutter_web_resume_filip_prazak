import 'package:flutter/cupertino.dart';

class SectionWidget extends StatelessWidget {
  final Widget body;
  SectionWidget(this.body, {Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width * 0.02;
    final mediaQueryHeight = MediaQuery.of(context).size.height * 0.1;
    return Padding(
      padding: EdgeInsets.only(
          left: mediaQueryWidth, right: mediaQueryWidth, bottom: mediaQueryHeight, top: mediaQueryHeight),
      child: body,
    );
  }
}
