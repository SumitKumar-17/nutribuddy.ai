import 'package:flutter/material.dart';
import 'package:nutribuddy.ai/designs/theme.dart';
import 'package:nutribuddy.ai/event.dart';
import 'package:nutribuddy.ai/event.dart';
import 'event_page1.dart'; // Import your event page files
import 'event_page2.dart';
import 'event_page3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Events Class',
      theme: Themes.theme,
      home: Events(),
    );
  }
}


