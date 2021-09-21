import 'package:flutter/cupertino.dart';

class SpacerHeight extends StatelessWidget {
  final double height;

  const SpacerHeight(this.height, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
    );
  }
}
