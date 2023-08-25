import 'package:flutter/material.dart';
import 'package:nutribuddy.ai/notification_service.dart';
import 'package:nutribuddy.ai/hydration_tracking.dart';
import 'package:nutribuddy.ai/settings_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NotificationService notificationService = NotificationService();
  final HydrationTracking hydrationTracking = HydrationTracking();

  @override
  void initState() {
    super.initState();
    notificationService.initializeNotifications(context);

    _scheduleReminder();
  }

  void _scheduleReminder() async {
    await notificationService.scheduleReminder(
        context); // Pass the BuildContext
  }

  void _drinkWater(int amount) {
    hydrationTracking.addWaterIntake(amount);
    _scheduleReminder();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double intakePercentage = hydrationTracking.getCurrentIntake() /
        hydrationTracking.dailyIntakeGoal;

    return Scaffold(
      appBar: AppBar(
        title: Text('Hydration Reminder'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _drinkWater(150),
                  child: Text('Drink 150 ml'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => _drinkWater(300),
                  child: Text('Drink 300 ml'),
                ),
              ],
            ),
            SizedBox(width: 20),
            CustomPaint(
              painter: VerticalWaterIconPainter(
                percentage: intakePercentage,
                backgroundImage: AssetImage('assets/water_droplet.jpeg'),
              ),
              child: Container(
                width: 120,
                height: 240,
                child: Center(
                  child: Text('${(intakePercentage * 100).toInt()}%'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VerticalWaterIconPainter extends CustomPainter {
  final double percentage;
  final ImageProvider backgroundImage;

  VerticalWaterIconPainter({
    required this.percentage,
    required this.backgroundImage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Implementation of vertical water icon painter
    // Similar to previous WaterIconPainter, but adjusted for vertical layout
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
