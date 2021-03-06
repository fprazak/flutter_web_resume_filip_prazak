import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget2 extends StatelessWidget {
  final String text;

  const TextWidget2(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle headline4 = Theme.of(context).textTheme.headline4!;
    return Text(
      text,
      style: GoogleFonts.lato(
          textStyle: headline4, color: const Color.fromRGBO(52, 58, 64, 1), fontWeight: FontWeight.bold),
    );
  }
}
