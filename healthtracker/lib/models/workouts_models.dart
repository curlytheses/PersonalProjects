enum WorkoutType {
  jogging,
  weightlifting,
  yoga,
  cardio,
}

class Workout {
  final String name;
  final DateTime dateTime;
  Duration duration; // Make duration mutable
  final WorkoutType workoutType;
  final String notes;

  Workout({
    required this.name,
    required this.dateTime,
    required this.duration,
    required this.workoutType,
    this.notes = '',
  });
}
