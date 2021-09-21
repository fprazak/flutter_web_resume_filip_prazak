import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutFullName extends StatelessWidget {
  const AboutFullName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle headline3 = Theme.of(context).textTheme.headline3!;
    return Row(
      children: [
        _makeText("FILIP ", const Color.fromRGBO(52, 58, 64, 1), headline3),
        _makeText("PRAŽÁK", const Color.fromRGBO(205, 55, 0, 1), headline3)
      ],
    );
  }

  Text _makeText(String name, Color color, TextStyle textStyle) {
    return Text(
      name,
      style: GoogleFonts.lato(textStyle: textStyle, color: color, fontWeight: FontWeight.bold),
    );
  }
}
