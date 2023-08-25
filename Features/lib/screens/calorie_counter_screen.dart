import 'package:flutter/material.dart';
import 'package:nutribuddy.ai/models/food_item.dart';
import 'package:nutribuddy.ai/widgets/food_item_tile.dart';
import 'package:nutribuddy.ai/widgets/food_input_form.dart';
import 'package:nutribuddy.ai/styles.dart';

import '../widgets/daily_goal_form.dart';
import 'goal_setting_page.dart';

class CalorieCounterScreen extends StatefulWidget {
  @override
  _CalorieCounterScreenState createState() => _CalorieCounterScreenState();
}

class _CalorieCounterScreenState extends State<CalorieCounterScreen> {
  double dailyGoal = 2000; // Default daily goal
  List<FoodItem> foodItems = [];

  void addFoodItem(FoodItem item) {
    setState(() {
      foodItems.add(item);
    });
  }
  void setDailyGoal(double goal) {
    setState(() {
      dailyGoal = goal;
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalCaloriesConsumed = foodItems.fold(0, (sum, item) => sum + item.calories);
    double percentageAchieved = totalCaloriesConsumed / dailyGoal;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calorie Counter',
          style: AppStyles.headerStyle,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GoalSettingPage(setDailyGoal),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 150.0,
            width: 150.0,
            child: CircularProgressIndicator(
              value: percentageAchieved,
              strokeWidth: 12.0,
              valueColor: AlwaysStoppedAnimation<Color>(AppStyles.themeData.colorScheme.secondary),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                return FoodItemTile(foodItems[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FoodInputForm(addFoodItem),
          ),
        ],
      ),
    );
  }
}