import 'package:flutter/cupertino.dart';

class SpacerWidth extends StatelessWidget {
  final double width;

  SpacerWidth(this.width);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
    );
  }
}
