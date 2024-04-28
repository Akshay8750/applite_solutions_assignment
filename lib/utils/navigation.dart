import 'package:applite_solutions/lets_trip_app.dart';
import 'package:flutter/material.dart';

void moveTo({required Widget screenName, BuildContext? context}) {
  Navigator.push(
      context ?? navigatorKey.currentContext!, MaterialPageRoute(builder: (context) => screenName));
}

void moveAndKillAll({required Widget screenName, BuildContext? context}) {
  Navigator.pushAndRemoveUntil(context ?? navigatorKey.currentContext!,
      MaterialPageRoute(builder: (context) => screenName), (route) => false);
}

///back to last screen
void backToPrevious({BuildContext? context}) {
  Navigator.pop(context ?? navigatorKey.currentContext!);
}

void backWithData<T>({required T data, BuildContext? context}) {
  Navigator.pop(context ?? navigatorKey.currentContext!, data);
}

///back to custom screen
void backUntil({required int noOfScreen, BuildContext? context}) {
  int count = 0;
  Navigator.of(context ?? navigatorKey.currentContext!).popUntil((_) => count++ >= noOfScreen);
}
