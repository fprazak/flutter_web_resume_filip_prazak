import 'package:flutter/cupertino.dart';
import 'package:web_resume_filip_prazak/components/skills_container.dart';
import 'package:web_resume_filip_prazak/components/text_widget.dart';

final aboutAdress = "BEZRUČOVA 22 · BRNO, 60200 · (+420) 736431819 · FILIP@REINSPIRO.COM ";

final aboutMe = "The best way to predict the future is to invent it. I found a lot of space for my "
    "creative mind in software development. On my way, I gain skills in mobile and "
    "website development and fell in love with Flutter.";

final experienceReinspiro = TextWidget("FLUTTER DEVELOPER & CEO", "Jan 2020 - Present", "REINSPIRO",
    "In 2020 I've decided to become a freelancer and founded Reinspiro. With covid crisis as important factor company focused on package delivery. Thanks to Flutter and multiplatform development I was able to release 2 apps Reinspiro driver and Komunita on both Android and iOS in a short timeframe. In apps, I work e.g. with Rest API, WebSockets, Firebase, and more.");

final experienceSkinners = TextWidget(
    "EXECUTIVE MANAGER",
    "Nov 2018 - Jan 2021",
    "SKINNERS TECHNOLOGIES",
    "As an executive manager, I was responsible for overseeing the operations mostly in "
        "the IT department and warehouse. My mission was to deliver the best service to "
        "our customers and lead my team.");

final experienceAlvao = TextWidget(
    "IT CONSULTANT",
    "Feb 2017 - Aug 2018",
    "ALVAO",
    "My daily bread was communication with customers from the early starts of projects to "
        "closure. I learned how to use ITIL and its best practices to deliver the best "
        "services to customers.");

final educationMaster = TextWidget("MASARYK UNIVERSITY - MASTERS'S DEGREE", "2016 - 2018", "FACULTY OF INFORMATICS",
    "Service Science Management, and Engineering");

final educationBachelor = TextWidget("MASARYK UNIVERSITY - BACHELOR'S DEGREE", "2012 - 2015", "FACULTY OF INFORMATICS",
    "Computer Systems and Data Processing");

final skillsLanguages = TextWidget("", "", "PROGRAMMING LANGUAGES & TOOLS", "");

final interests = TextWidget(
    "",
    "",
    "WHAT DO I LIKE?",
    "In my free time, I try to extend my apps to new functionalities. This summer I "
        "suffered from tick-borne encephalitis so I came back to fishing to get some "
        "rest and relaxation. I am a lot competitive so I play a lot of sports. "
        "Volleyball, football, and floorball I play the most.");

final skillsIconContainer = Wrap(
  children: [
    SkillsIconContainer('assets/images/languagesAndTool'
        's/flutterIcon.png'),
    SkillsIconContainer('assets/images/languagesAndTools'
        '/dartIcon.png'),
    SkillsIconContainer('assets/images/languagesAndTools'
        '/firebaseIcon.png'),
    SkillsIconContainer('assets/images/languagesAndTools'
        '/htmlIcon.png'),
    SkillsIconContainer('assets/images/languagesAndTools'
        '/cssIcon.png'),
    SkillsIconContainer('assets/images/languagesAndTools'
        '/bootstrapIcon.png'),
    SkillsIconContainer('assets/images/languagesAndTools'
        '/cIcon.png'),
    SkillsIconContainer('assets/images/languagesAndTools'
        '/csharpIcon.png'),
    SkillsIconContainer('assets/images/languagesAndTools'
        '/javaIcon.png'),
    SkillsIconContainer('assets/images/languagesAndTools'
        '/githubIcon.png'),
    SkillsIconContainer('assets/images/languagesAndTools'
        '/trelloIcon.png'),
    SkillsIconContainer('assets/images/languagesAndTools'
        '/slackIcon.png'),
  ],
);
