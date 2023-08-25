import 'package:flutter/material.dart';
import 'package:nutribuddy.ai/event_page1.dart';
import 'package:nutribuddy.ai/event_page2.dart';
import 'package:nutribuddy.ai/event_page3.dart';



class Events extends StatefulWidget {


  @override
  State<Events> createState() => _EventsState();
}
class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.line_weight),
        title: Text('NutriBuddy'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16), // Adjust padding
                textStyle: TextStyle(fontSize: 18), // Adjust font size
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VaccineChecklistApp(),
                  ),
                );
              },
              child: Text('Vaccine Information'),
            ),
            SizedBox(height: 10), // Add some spacing between buttons
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16), // Adjust padding
                textStyle: TextStyle(fontSize: 18), // Adjust font size
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HydrationApp(),
                  ),
                );
              },
              child: Text('Hydration Tracker'),
            ),
            SizedBox(height: 10), // Add some spacing between buttons
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16), // Adjust padding
                textStyle: TextStyle(fontSize: 18), // Adjust font size
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CalorieCounterApp(),
                  ),
                );
              },
              child: Text('Calorie Tracker'),
            ),
          ],
        ),
      ),
    );
  }
}
