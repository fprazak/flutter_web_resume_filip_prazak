import 'package:flutter/cupertino.dart';

class SpacerWidth extends StatelessWidget {
  final double width;

  const SpacerWidth(this.width, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
    );
  }
}
