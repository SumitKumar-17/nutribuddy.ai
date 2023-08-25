import 'package:flutter/material.dart';
import 'package:nutribuddy.ai/models/food_item.dart';
import 'package:nutribuddy.ai/styles.dart';

class FoodItemTile extends StatelessWidget {
  final FoodItem foodItem;

  FoodItemTile(this.foodItem);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        foodItem.name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        '${foodItem.quantity.toStringAsFixed(2)} units',
        style: TextStyle(color: Colors.grey),
      ),
      trailing: Text(
        '${foodItem.calories.toStringAsFixed(2)} cal',
        style: TextStyle(color: AppStyles.themeData.colorScheme.secondary),
      ),
    );
  }
}
