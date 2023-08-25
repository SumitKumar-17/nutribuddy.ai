import 'package:flutter/material.dart';
import 'package:nutribuddy.ai/screens/vaccine_list_screen.dart';




class VaccineChecklistApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vaccine Checklist App',
      home: VaccineListScreen(),
    );
  }
}


