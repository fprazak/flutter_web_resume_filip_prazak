import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OwnTextWidget extends StatelessWidget {
  final String position;
  final String timeline;
  final String company;
  final String positionDescription;

  OwnTextWidget(this.position, this.timeline, this.company, this.positionDescription);

  Widget ownTextTemplate(String text, TextStyle headline, Color color) {
    if (text.length != 0) {
      return Text(text, style: GoogleFonts.lato(fontWeight: FontWeight.bold, textStyle: headline, color: color));
    } else
      return SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle headline5 = Theme.of(context).textTheme.headline5!;
    final TextStyle headline6 = Theme.of(context).textTheme.headline6!;
    final TextStyle subtitle1 = Theme.of(context).textTheme.subtitle1!;
    final TextStyle subtitle2 = Theme.of(context).textTheme.subtitle2!;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 30,
        ),
        if (mediaQueryWidth > 800)
          Row(
            children: [
              ownTextTemplate(position, headline5, Color.fromRGBO(52, 58, 64, 1)),
              Spacer(),
              ownTextTemplate(timeline, subtitle2, Color.fromRGBO(205, 55, 0, 1)),
            ],
          ),
        if (MediaQuery.of(context).size.width < 800)
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ownTextTemplate(position, headline5, Color.fromRGBO(52, 58, 64, 1)),
              Spacer(),
              ownTextTemplate(timeline, subtitle2, Color.fromRGBO(205, 55, 0, 1)),
            ],
          ),
        Container(
          height: 15,
        ),
        ownTextTemplate(company, headline6, Color.fromRGBO(108, 117, 125, 1)),
        Container(
          height: 15,
        ),
        ownTextTemplate(positionDescription, subtitle1, Color.fromRGBO(130, 126, 130, 1)),
        Container(
          height: 5,
        ),
      ],
    );
  }
}
