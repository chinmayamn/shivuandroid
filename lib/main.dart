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
    home: HomePage(), //default route
    routes: {
      Routes.home: (context) => HomePage(),
      Routes.weddings: (context) => WeddingsPage(),
      Routes.prepostweddings: (context) => PrePostWeddingsPage(),
      Routes.engagementshots: (context) => EngagementShotsPage(),
      Routes.pregnancyclicks: (context) => PregnancyClicksPage(),
      Routes.babyphotography: (context) => BabyPhotographyPage(),
    },
  ));
}
