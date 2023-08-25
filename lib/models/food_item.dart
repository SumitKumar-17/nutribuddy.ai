class FoodItem {
  final String name;
  final double quantity;
  double calories=0;

  FoodItem({required this.name, required this.quantity}) {
    // Replace this with a proper calorie calculation method
    calories = 50 * quantity;
  }
}
