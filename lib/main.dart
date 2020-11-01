import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'routes.dart';
import 'dart:io';
//import 'package:connectivity/connectivity.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode)
      exit(1);
     };

  runApp(MaterialApp(
    theme: new ThemeData(scaffoldBackgroundColor: Colors.black),
    home: HomePage(),
    routes: {
      Routes.home: (context) => HomePage(),
      Routes.weddings: (context) => WeddingsPage(),
      Routes.prepostweddings: (context) => PrePostWeddingsPage(),
      Routes.engagementshots: (context) => EngagementShotsPage(),
      Routes.pregnancyclicks: (context) => PregnancyClicksPage(),
      Routes.babyphotography: (context) => BabyPhotographyPage(),
      Routes.kidsphotography: (context) => KidsPhotographyPage(),
      Routes.eventsphotography: (context) => EventsPhotographyPage(),
      Routes.wildlife: (context) => WildlifePage(),
      Routes.creative: (context) => CreativePage(),
      Routes.photographyinrain: (context) => PhotographyInRainPage(),
      Routes.macro: (context) => MacroPage(),
      Routes.monochrome: (context) => MonochromePage(),
      Routes.birds: (context) => BirdsPage(),
      Routes.colourpictorial: (context) => ColourPictorialPage(),
      Routes.pictorialsport: (context) => PictorialSportPage(),
      Routes.iam: (context) => IamPage(),
      Routes.interviews: (context) => InterviewsPage(),
      Routes.contactme: (context) => ContactMePage(),
      Routes.photodetails:(context)=> PhotoDetailsPage(),
    },
  ));
}
