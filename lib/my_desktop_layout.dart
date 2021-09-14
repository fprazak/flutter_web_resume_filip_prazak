import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_resume_filip_prazak/components/spacer_height.dart';
import 'package:web_resume_filip_prazak/components/spacer_width.dart';
import 'package:web_resume_filip_prazak/data/data.dart';

import 'components/own_section_widget.dart';
import 'components/own_text_widget2.dart';
import 'components/sized_box_icon_about_section.dart';

class MyDesktopLayout extends StatelessWidget {
  final anchorAbout = GlobalKey();
  final anchorExperience = GlobalKey();
  final anchorEducation = GlobalKey();
  final anchorSkills = GlobalKey();
  final anchorInterests = GlobalKey();

  void scrollToAnchor(GlobalKey anchor) {
    WidgetsBinding.instance!.addPostFrameCallback(
        (_) => Scrollable.ensureVisible(anchor.currentContext!, duration: Duration(milliseconds: 1500)));
  }

  Future<void> _launchMailClient() async {
    const mailUrl = 'mailto:filip@reinspiro.com';
    try {
      await launch(mailUrl);
    } catch (e) {
      throw 'Could not launch $mailUrl';
    }
  }

  Widget ownSkillsIconContainer(String imagePath) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(5),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(100), border: Border.all(width: 2, color: Colors.grey)),
      child:
          IconButton(iconSize: 30, color: Color.fromRGBO(205, 55, 0, 1), onPressed: null, icon: Image.asset(imagePath)),
    );
  }

  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    final TextStyle headline5 = Theme.of(context).textTheme.headline5!;
    final TextStyle headline6 = Theme.of(context).textTheme.headline6!;
    final TextStyle headline2 = Theme.of(context).textTheme.headline2!;

    Widget ownSizedBoxForMenu(GlobalKey<State<StatefulWidget>> anchor, String text) {
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
        mainAxisSize: MainAxisSize.min,
        children: [
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
                  Container(
                    height: 20,
                  ),
                  ownSizedBoxForMenu(anchorAbout, "ABOUT"),
                  ownSizedBoxForMenu(anchorExperience, "EXPERIENCE"),
                  ownSizedBoxForMenu(anchorEducation, "EDUCATION"),
                  ownSizedBoxForMenu(anchorSkills, "SKILLS"),
                  ownSizedBoxForMenu(anchorInterests, "INTERESTS"),
                ],
              )),
          Container(
            width: mediaQueryWidth * 0.8,
            child: SingleChildScrollView(
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
                              Row(
                                children: [
                                  Text(
                                    "FILIP ",
                                    style: GoogleFonts.lato(
                                        textStyle: headline2,
                                        color: Color.fromRGBO(52, 58, 64, 1),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "PRAŽÁK",
                                    style: GoogleFonts.lato(
                                        textStyle: headline2,
                                        color: Color.fromRGBO(205, 55, 0, 1),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
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
                      child: OwnSectionsWidget(
                        Container(
                          width: mediaQueryWidth * 0.7,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                OwnTextWidget2("EXPERIENCE"),
                                experienceReinspiro,
                                experienceSkinners,
                                experienceAlvao
                              ]),
                        ),
                      )),
                  Divider(),
                  Flexible(
                    key: anchorEducation,
                    child: OwnSectionsWidget(
                      Container(
                        width: mediaQueryWidth * 0.7,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              OwnTextWidget2("EDUCATION"),
                              educationMaster,
                              educationBachelor,
                            ]),
                      ),
                    ),
                  ),
                  Divider(),
                  Flexible(
                    key: anchorSkills,
                    child: OwnSectionsWidget(
                      Container(
                        width: mediaQueryWidth * 0.7,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              OwnTextWidget2("SKILLS"),
                              skillsLanguages,
                              Wrap(
                                children: [
                                  ownSkillsIconContainer('assets/images/languagesAndTool'
                                      's/flutterIcon.png'),
                                  ownSkillsIconContainer('assets/images/languagesAndTools'
                                      '/dartIcon.png'),
                                  ownSkillsIconContainer('assets/images/languagesAndTools'
                                      '/firebaseIcon.png'),
                                  ownSkillsIconContainer('assets/images/languagesAndTools'
                                      '/htmlIcon.png'),
                                  ownSkillsIconContainer('assets/images/languagesAndTools'
                                      '/cssIcon.png'),
                                  ownSkillsIconContainer('assets/images/languagesAndTools'
                                      '/bootstrapIcon.png'),
                                  ownSkillsIconContainer('assets/images/languagesAndTools'
                                      '/cIcon.png'),
                                  ownSkillsIconContainer('assets/images/languagesAndTools'
                                      '/csharpIcon.png'),
                                  ownSkillsIconContainer('assets/images/languagesAndTools'
                                      '/javaIcon.png'),
                                  ownSkillsIconContainer('assets/images/languagesAndTools'
                                      '/githubIcon.png'),
                                  ownSkillsIconContainer('assets/images/languagesAndTools'
                                      '/trelloIcon.png'),
                                  ownSkillsIconContainer('assets/images/languagesAndTools'
                                      '/slackIcon.png'),
                                ],
                              )
                            ]),
                      ),
                    ),
                  ),
                  Divider(),
                  Flexible(
                    key: anchorInterests,
                    child: OwnSectionsWidget(
                      Container(
                        width: mediaQueryWidth * 0.7,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              OwnTextWidget2("INTERESTS"),
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
      /*floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(205, 55, 0, 1),
        onPressed: () {
          scrollToAnchor(anchorAbout);
        },
        child: Icon(Icons.home),
      ),*/
    );
  }
}
