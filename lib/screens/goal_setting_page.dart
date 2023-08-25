import 'package:flutter/material.dart';
import 'package:nutribuddy.ai/styles.dart';

class GoalSettingPage extends StatefulWidget {
  final void Function(double) onGoalSet;

  GoalSettingPage(this.onGoalSet);

  @override
  _GoalSettingPageState createState() => _GoalSettingPageState();
}

class _GoalSettingPageState extends State<GoalSettingPage> {
  final TextEditingController _goalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Daily Goal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _goalController,
              decoration: InputDecoration(
                labelText: 'Set Daily Goal',
                labelStyle: AppStyles.formLabelStyle,
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                double goal = double.tryParse(_goalController.text) ?? 0;
                if (goal > 0) {
                  widget.onGoalSet(goal);
                  Navigator.pop(context); // Close the goal setting page
                }
              },
              child: Text('Set Goal'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _goalController.dispose();
    super.dispose();
  }
}
