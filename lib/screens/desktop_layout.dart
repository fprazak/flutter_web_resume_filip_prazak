import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_resume_filip_prazak/components/about_full_name.dart';
import 'package:web_resume_filip_prazak/components/spacer_height.dart';
import 'package:web_resume_filip_prazak/components/spacer_width.dart';
import 'package:web_resume_filip_prazak/data/data.dart';

import '../components/section_widget.dart';
import '../components/text_widget2.dart';

class DesktopLayout extends StatelessWidget {
  final anchorAbout = GlobalKey();
  final anchorExperience = GlobalKey();
  final anchorEducation = GlobalKey();
  final anchorSkills = GlobalKey();
  final anchorInterests = GlobalKey();

  DesktopLayout({Key? key}) : super(key: key);

  void scrollToAnchor(GlobalKey anchor) {
    WidgetsBinding.instance!.addPostFrameCallback(
        (_) => Scrollable.ensureVisible(anchor.currentContext!, duration: const Duration(milliseconds: 1500)));
  }

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

    Widget ownSizedBoxForMenu(GlobalKey<State<StatefulWidget>> anchor, String text) {
      return SizedBox(
        height: mediaQueryHeight * 0.07,
        child: TextButton(
            onPressed: () => scrollToAnchor(anchor),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            )),
      );
    }

    return Scaffold(
      body: Row(
        children: <Widget>[
          Container(
              height: mediaQueryHeight,
              width: mediaQueryWidth * 0.2,
              color: const Color.fromRGBO(205, 55, 0, 1),
              alignment: Alignment.center,
              // where to position the child
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      width: mediaQueryHeight * 0.25,
                      height: mediaQueryHeight * 0.25,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(189, 93, 56, 1),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/profileImage.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                        border: Border.all(
                          color: Colors.white,
                          width: 3.0,
                        ),
                      ),
                    ),
                  ),
                  const SpacerHeight(20),
                  ownSizedBoxForMenu(anchorAbout, "ABOUT"),
                  ownSizedBoxForMenu(anchorExperience, "EXPERIENCE"),
                  ownSizedBoxForMenu(anchorEducation, "EDUCATION"),
                  ownSizedBoxForMenu(anchorSkills, "SKILLS"),
                  ownSizedBoxForMenu(anchorInterests, "INTERESTS"),
                ],
              )),
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: SizedBox(
                      height: mediaQueryHeight,
                      key: anchorAbout,
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: mediaQueryWidth * 0.02,
                              right: mediaQueryWidth * 0.02,
                              bottom: mediaQueryHeight * 0.2,
                              top: mediaQueryHeight * 0.2),
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
                                          iconSize: 25,
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
                      child: SectionWidget(
                        SizedBox(
                          width: mediaQueryWidth * 0.7,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                TextWidget2("EXPERIENCE"),
                                experienceReinspiro,
                                experienceSkinners,
                                experienceAlvao
                              ]),
                        ),
                      )),
                  const Divider(),
                  Flexible(
                    key: anchorEducation,
                    child: SectionWidget(
                      SizedBox(
                        width: mediaQueryWidth * 0.7,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              TextWidget2("EDUCATION"),
                              educationMaster,
                              educationBachelor,
                            ]),
                      ),
                    ),
                  ),
                  const Divider(),
                  Flexible(
                    key: anchorSkills,
                    child: SectionWidget(
                      SizedBox(
                        width: mediaQueryWidth * 0.7,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextWidget2("SKILLS"),
                              skillsLanguages,
                              skillsIconContainer,
                            ]),
                      ),
                    ),
                  ),
                  const Divider(),
                  Flexible(
                    key: anchorInterests,
                    child: SectionWidget(
                      SizedBox(
                        width: mediaQueryWidth * 0.7,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              TextWidget2("INTERESTS"),
                              interests,
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
