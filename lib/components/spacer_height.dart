import 'package:flutter/cupertino.dart';

class SpacerHeight extends StatelessWidget {
  final double height;

  SpacerHeight(this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
    );
  }
}
