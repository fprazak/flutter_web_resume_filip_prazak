import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_resume_filip_prazak/components/spacer_height.dart';

class TextWidget extends StatelessWidget {
  final String position;
  final String timeline;
  final String company;
  final String positionDescription;

  const TextWidget(this.position, this.timeline, this.company, this.positionDescription, {Key? key}) : super(key: key);

  Widget ownTextTemplate(String text, TextStyle headline, Color color) {
    if (text.isNotEmpty) {
      return Text(text, style: GoogleFonts.lato(fontWeight: FontWeight.bold, textStyle: headline, color: color));
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle headline5 = Theme.of(context).textTheme.headline5!;
    final TextStyle headline6 = Theme.of(context).textTheme.headline6!;
    final TextStyle subtitle1 = Theme.of(context).textTheme.subtitle1!;
    final TextStyle subtitle2 = Theme.of(context).textTheme.subtitle2!;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SpacerHeight(30),
        // if (mediaQueryWidth > 1000)
        Wrap(
          spacing: mediaQueryWidth * 0.7,
          children: [
            ownTextTemplate(position, headline5, const Color.fromRGBO(52, 58, 64, 1)),
            ownTextTemplate(timeline, subtitle2, const Color.fromRGBO(205, 55, 0, 1)),
          ],
        ),
        const SpacerHeight(15),
        ownTextTemplate(company, headline6, const Color.fromRGBO(108, 117, 125, 1)),
        const SpacerHeight(15),
        ownTextTemplate(positionDescription, subtitle1, const Color.fromRGBO(130, 126, 130, 1)),
        const SpacerHeight(5),
      ],
    );
  }
}
