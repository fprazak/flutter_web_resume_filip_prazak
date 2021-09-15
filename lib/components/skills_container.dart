import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SkillsIconContainer extends StatelessWidget {
  final String imagePath;

  SkillsIconContainer(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(5),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all(width: 2, color: Colors.grey)),
      child:
          IconButton(iconSize: 30, color: Color.fromRGBO(205, 55, 0, 1), onPressed: null, icon: Image.asset(imagePath)),
    );
  }
}
