import 'package:flutter/material.dart';

class DailyGoalForm extends StatefulWidget {
  final void Function(double) onGoalSet;

  DailyGoalForm(this.onGoalSet);

  @override
  _DailyGoalFormState createState() => _DailyGoalFormState();
}

class _DailyGoalFormState extends State<DailyGoalForm> {
  final TextEditingController _goalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _goalController,
          decoration: InputDecoration(labelText: 'Set Daily Goal'),
          keyboardType: TextInputType.number,
        ),
        ElevatedButton(
          onPressed: () {
            double goal = double.tryParse(_goalController.text) ?? 0;
            if (goal > 0) {
              widget.onGoalSet(goal);
              _goalController.clear();
            }
          },
          child: Text('Set Goal'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _goalController.dispose();
    super.dispose();
  }
}
