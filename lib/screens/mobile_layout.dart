import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/about_full_name.dart';
import '../components/section_widget.dart';
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

  MobileLayout({Key? key}) : super(key: key);

  Future<void> _launchMailClient() async {
    const mailUrl = 'mailto:filip@reinspiro.com';
    await launch(mailUrl);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final TextStyle headline5 = Theme.of(context).textTheme.headline5!;
    final TextStyle headline6 = Theme.of(context).textTheme.headline6!;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter resumé Filip Pražák"),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(),
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
                          const AboutFullName(),
                          const SpacerHeight(15),
                          Text(aboutAddress,
                              style: GoogleFonts.lato(
                                  textStyle: headline5, color: const Color.fromRGBO(108, 117, 125, 1))),
                          const SpacerHeight(35),
                          Text(aboutMe,
                              style: GoogleFonts.lato(
                                  textStyle: headline6, color: const Color.fromRGBO(130, 126, 130, 1))),
                          const SpacerHeight(35),
                          Row(
                            children: [
                              linkedin,
                              const SpacerWidth(10),
                              komunitaApp,
                              const SpacerWidth(10),
                              SizedBox(
                                height: 60,
                                width: 60,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: const Color.fromRGBO(52, 58, 64, 1),
                                    shape: const CircleBorder(),
                                  ),
                                  child: IconButton(
                                      iconSize: 30,
                                      color: const Color.fromRGBO(205, 55, 0, 1),
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
              const Divider(),
              Flexible(
                key: anchorExperience,
                child: SectionWidget(Column(
                  children: [TextWidget2("EXPERIENCE"), experienceReinspiro, experienceSkinners, experienceAlvao],
                )),
              ),
              const Divider(),
              Flexible(
                key: anchorEducation,
                child: SectionWidget(Column(children: [
                  TextWidget2("EDUCATION"),
                  educationMaster,
                  educationBachelor,
                ])),
              ),
              const Divider(),
              Flexible(
                key: anchorSkills,
                child: SectionWidget(Column(children: [TextWidget2("SKILLS"), skillsLanguages, skillsIconContainer])),
              ),
              const Divider(),
              Flexible(
                key: anchorInterests,
                child: SectionWidget(Column(children: [
                  TextWidget2("INTERESTS"),
                  interests,
                ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
