import 'package:flutter/cupertino.dart';
import 'package:web_resume_filip_prazak/components/section_widget.dart';

class FlexibleWithContainer extends StatelessWidget {
  final GlobalKey<State<StatefulWidget>> anchor;
  final double mediaQueryWidth;
  final SectionWidget sectionWidget;

  const FlexibleWithContainer(this.anchor, this.mediaQueryWidth, this.sectionWidget, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flexible(
        key: anchor,
        child: SizedBox(
          width: mediaQueryWidth * 0.8,
          child: sectionWidget,
        ));
  }
}
