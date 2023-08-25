class HydrationTracking {
  int totalWaterIntake = 0;
  int dailyIntakeGoal = 2500;
  List<int> intakeHistory = [];

  void addWaterIntake(int amount) {
    totalWaterIntake += amount;
    intakeHistory.add(amount);
  }

  int getCurrentIntake() {
    return totalWaterIntake;
  }

  int getRemainingIntake() {
    return dailyIntakeGoal - totalWaterIntake;
  }

  List<int> getIntakeHistory() {
    return intakeHistory;
  }
}
