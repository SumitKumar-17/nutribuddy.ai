import 'package:flutter/material.dart';

class AppStyles {
  static ThemeData themeData = ThemeData(
    fontFamily: 'Roboto', colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.green),
  );

  static TextStyle headerStyle = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle goalStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  );

  static TextStyle formLabelStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );
}
