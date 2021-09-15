import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutFullName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle headline2 = Theme.of(context).textTheme.headline2!;
    final TextStyle headline3 = Theme.of(context).textTheme.headline3!;
    return Row(
      children: [
        Text(
          "FILIP ",
          style:
              GoogleFonts.lato(textStyle: headline3, color: Color.fromRGBO(52, 58, 64, 1), fontWeight: FontWeight.bold),
        ),
        Text(
          "PRAŽÁK",
          style:
              GoogleFonts.lato(textStyle: headline3, color: Color.fromRGBO(205, 55, 0, 1), fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
