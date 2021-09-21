import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_resume_filip_prazak/components/about_full_name.dart';
import 'package:web_resume_filip_prazak/components/spacer_height.dart';
import 'package:web_resume_filip_prazak/components/spacer_width.dart';
import 'package:web_resume_filip_prazak/data/data.dart';

import '../components/flexible_with_container.dart';
import '../components/section_widget.dart';
import '../components/sized_box_icon_about_section.dart';
import '../components/text_widget2.dart';

class DesktopLayout extends StatelessWidget {
  final anchorAbout = GlobalKey();
  final anchorExperience = GlobalKey();
  final anchorEducation = GlobalKey();
  final anchorSkills = GlobalKey();
  final anchorInterests = GlobalKey();

  // Moves to specific anchor on page.
  void scrollToAnchor(GlobalKey anchor) {
    WidgetsBinding.instance!.addPostFrameCallback(
        (_) => Scrollable.ensureVisible(anchor.currentContext!, duration: Duration(milliseconds: 1500)));
  }

  // Opens the mail client with recipient
  Future<void> _launchMailClient() async {
    const mailUrl = 'mailto:filip@reinspiro.com';
    await launch(mailUrl);
  }

  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    final TextStyle headline5 = Theme.of(context).textTheme.headline5!;
    final TextStyle headline6 = Theme.of(context).textTheme.headline6!;

    // Return specific size of sizedbox
    Widget sizedBoxForMenu(GlobalKey<State<StatefulWidget>> anchor, String text) {
      return SizedBox(
        height: mediaQueryHeight * 0.07,
        child: TextButton(
            onPressed: () => scrollToAnchor(anchor),
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      );
    }

    return Scaffold(
      body: Row(
        children: <Widget>[
          Container(
              height: mediaQueryHeight,
              width: mediaQueryWidth * 0.2,
              color: Color.fromRGBO(205, 55, 0, 1),
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
                        color: Color.fromRGBO(189, 93, 56, 1),
                        image: DecorationImage(
                          image: AssetImage('assets/images/profileImage.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(100.0)),
                        border: Border.all(
                          color: Colors.white,
                          width: 3.0,
                        ),
                      ),
                    ),
                  ),
                  SpacerHeight(20),
                  sizedBoxForMenu(anchorAbout, "ABOUT"),
                  sizedBoxForMenu(anchorExperience, "EXPERIENCE"),
                  sizedBoxForMenu(anchorEducation, "EDUCATION"),
                  sizedBoxForMenu(anchorSkills, "SKILLS"),
                  sizedBoxForMenu(anchorInterests, "INTERESTS"),
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
                              AboutFullName(),
                              SpacerHeight(15),
                              Text(aboutAdress,
                                  style:
                                      GoogleFonts.lato(textStyle: headline5, color: Color.fromRGBO(108, 117, 125, 1))),
                              SpacerHeight(35),
                              Text(aboutMe,
                                  style:
                                      GoogleFonts.lato(textStyle: headline6, color: Color.fromRGBO(130, 126, 130, 1))),
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
                                    height: 70,
                                    width: 70,
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
                  FlexibleWithContainer(
                    anchorExperience,
                    mediaQueryWidth,
                    SectionWidget(
                        [TextWidget2("EXPERIENCE"), experienceReinspiro, experienceSkinners, experienceAlvao]),
                  ),
                  Divider(),
                  FlexibleWithContainer(
                    anchorEducation,
                    mediaQueryWidth,
                    SectionWidget([
                      TextWidget2("EDUCATION"),
                      educationMaster,
                      educationBachelor,
                    ]),
                  ),
                  Divider(),
                  FlexibleWithContainer(
                    anchorSkills,
                    mediaQueryWidth,
                    SectionWidget([
                      TextWidget2("SKILLS"),
                      skillsLanguages,
                      skillsIconContainer,
                    ]),
                  ),
                  Divider(),
                  FlexibleWithContainer(
                    anchorInterests,
                    mediaQueryWidth,
                    SectionWidget([
                      TextWidget2("INTERESTS"),
                      interests,
                    ]),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(205, 55, 0, 1),
        onPressed: () {
          scrollToAnchor(anchorAbout);
        },
        child: Icon(Icons.home),
      ),
    );
  }
}
