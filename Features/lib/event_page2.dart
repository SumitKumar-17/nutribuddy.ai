import 'package:flutter/material.dart';
import 'package:nutribuddy.ai/home_page.dart';
import 'package:nutribuddy.ai/notification_service.dart';



class HydrationApp extends StatelessWidget {
  final NotificationService notificationService = NotificationService();

  @override
  Widget build(BuildContext context) {
    notificationService.initializeNotifications(context); // Initialize notifications
    notificationService.scheduleReminder(context); // Schedule the reminder

    return MaterialApp(
      title: 'Hydration Reminder',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}
