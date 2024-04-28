import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'lets_trip_app.dart';
import 'utils/di_setup.dart';

void main() async {
  /// initializing the framework
  WidgetsFlutterBinding.ensureInitialized();

  /// setting up the orientation of the app to portrait only
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);


  /// initialize DI container
  DISetup.setup();

  /// deep link check
  runApp(const AppSolApp());
}
