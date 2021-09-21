import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SkillsIconContainer extends StatelessWidget {
  final String imagePath;

  const SkillsIconContainer(this.imagePath, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(5),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all(width: 2, color: Colors.grey)),
      child: IconButton(
          iconSize: 30, color: const Color.fromRGBO(205, 55, 0, 1), onPressed: null, icon: Image.asset(imagePath)),
    );
  }
}
