import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

extension Separation on List<Widget> {
  ///add vertical gap between widgets
  List<Widget> separateVertically(double gap) {
    final separatedWidgets = <Widget>[];

    for (var i = 0; i < length; i++) {
      separatedWidgets.add(this[i]);
      if (i < length - 1) {
        separatedWidgets.add(SizedBox(height: gap));
      }
    }

    return separatedWidgets;
  }

  ///add horizontal gap between widgets
  List<Widget> separateHorizontally(double gap) {
    final separatedWidgets = <Widget>[];

    for (var i = 0; i < length; i++) {
      separatedWidgets.add(this[i]);
      if (i < length - 1) {
        separatedWidgets.add(SizedBox(width: gap));
      }
    }

    return separatedWidgets;
  }
}

bool isSuccessResponse(Response response) {
  return response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300;
}

bool checkIndex(int index) {
  return (index + 1) % 3 == 0 || index % 4 == 0;
}

String formatDate(String originalDate) {
  List<String> parts = originalDate.split('-');

  Map<String, String> months = {
    '01': 'Jan', '02': 'Feb', '03': 'Mar', '04': 'Apr',
    '05': 'May', '06': 'Jun', '07': 'Jul', '08': 'Aug',
    '09': 'Sept', '10': 'Oct', '11': 'Nov', '12': 'Dec'
  };

  String year = parts[0];
  String month = parts[1];
  String day = parts[2];

  String formattedDate = "${months[month]} $day, $year";

  return formattedDate;
}


