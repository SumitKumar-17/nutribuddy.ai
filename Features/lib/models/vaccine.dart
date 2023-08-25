class Vaccine {
  final String name;
  final String timeToBeTaken;
  final String age;
  final String diseaseprevented;
  final String sideeffects;
  bool taken;

  Vaccine({
    required this.name,
    required this.timeToBeTaken,
    required this.age,
    required this.diseaseprevented,
    required this.sideeffects,
    this.taken = false,
  });
}
