import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/about_full_name.dart';
import '../components/section_widget.dart';
import '../components/sized_box_icon_about_section.dart';
import '../components/spacer_height.dart';
import '../components/spacer_width.dart';
import '../components/text_widget2.dart';
import '../data/data.dart';

class MobileLayout extends StatelessWidget {
  final anchorAbout = GlobalKey();
  final anchorExperience = GlobalKey();
  final anchorEducation = GlobalKey();
  final anchorSkills = GlobalKey();
  final anchorInterests = GlobalKey();

  Future<void> _launchMailClient() async {
    const mailUrl = 'mailto:filip@reinspiro.com';
    await launch(mailUrl);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final TextStyle headline5 = Theme.of(context).textTheme.headline5!;
    final TextStyle headline6 = Theme.of(context).textTheme.headline6!;
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter resumé Filip Pražák"),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: SizedBox(
                  key: anchorAbout,
                  child: Padding(
                      padding: EdgeInsets.all(mediaQueryWidth * 0.1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AboutFullName(),
                          SpacerHeight(15),
                          Text(aboutAdress,
                              style: GoogleFonts.lato(textStyle: headline5, color: Color.fromRGBO(108, 117, 125, 1))),
                          SpacerHeight(35),
                          Text(aboutMe,
                              style: GoogleFonts.lato(textStyle: headline6, color: Color.fromRGBO(130, 126, 130, 1))),
                          SpacerHeight(35),
                          Row(
                            children: [
                              SizedBoxIconsAbout(
                                  'assets/images/linkedinIcon.png',
                                  'https://cz.linkedin'
                                      '.com/in/filip-pra%C5%BE%C3%A1k-935456124'),
                              SpacerWidth(10),
                              SizedBoxIconsAbout(
                                  'assets/images/facebookIcon.png',
                                  'https://cs-cz.facebook'
                                      '.com/prazak.filip'),
                              SpacerWidth(10),
                              SizedBoxIconsAbout('assets/images/appIcon.png', 'https://www.reinspiro.com/komunita'),
                              SpacerWidth(10),
                              SizedBox(
                                height: 60,
                                width: 60,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Color.fromRGBO(52, 58, 64, 1),
                                    shape: CircleBorder(),
                                  ),
                                  child: IconButton(
                                      iconSize: 30,
                                      color: Color.fromRGBO(205, 55, 0, 1),
                                      hoverColor: Colors.blueGrey.shade800,
                                      onPressed: () {
                                        _launchMailClient();
                                      },
                                      icon: Image.asset('assets/images/mailIcon.png')),
                                  onPressed: () {
                                    _launchMailClient();
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                ),
              ),
              Divider(),
              Flexible(
                key: anchorExperience,
                child: SectionWidget(
                    [TextWidget2("EXPERIENCE"), experienceReinspiro, experienceSkinners, experienceAlvao]),
              ),
              Divider(),
              Flexible(
                key: anchorEducation,
                child: SectionWidget([
                  TextWidget2("EDUCATION"),
                  educationMaster,
                  educationBachelor,
                ]),
              ),
              Divider(),
              Flexible(
                key: anchorSkills,
                child: SectionWidget([TextWidget2("SKILLS"), skillsLanguages, skillsIconContainer]),
              ),
              Divider(),
              Flexible(
                key: anchorInterests,
                child: SectionWidget([
                  TextWidget2("INTERESTS"),
                  interests,
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
