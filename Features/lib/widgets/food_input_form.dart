import 'package:nutribuddy.ai/models/food_item.dart';
import 'package:flutter/material.dart';
import 'package:nutribuddy.ai/models/food_item.dart';

class FoodInputForm extends StatefulWidget {
final void Function(FoodItem) onFoodAdded;

FoodInputForm(this.onFoodAdded);

@override
_FoodInputFormState createState() => _FoodInputFormState();
}

class _FoodInputFormState extends State<FoodInputForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _nameController,
          decoration: InputDecoration(labelText: 'Food Item'),
        ),
        TextField(
          controller: _quantityController,
          decoration: InputDecoration(labelText: 'Quantity'),
          keyboardType: TextInputType.number,
        ),
        ElevatedButton(
          onPressed: () {
            final String name = _nameController.text;
            final double quantity = double.tryParse(_quantityController.text) ?? 0;
            if (name.isNotEmpty && quantity > 0) {
              final FoodItem newItem = FoodItem(name: name, quantity: quantity);
              widget.onFoodAdded(newItem);
              _nameController.clear();
              _quantityController.clear();
            }
          },
          child: Text('Add Food'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    super.dispose();
  }
}
