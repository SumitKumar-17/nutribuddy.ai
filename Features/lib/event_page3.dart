import 'package:flutter/material.dart';
import 'package:nutribuddy.ai/screens/calorie_counter_screen.dart';
import 'package:nutribuddy.ai/styles.dart';



class CalorieCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calorie Counter App',
      theme: AppStyles.themeData,
      home: CalorieCounterScreen(),
    );
  }
}
