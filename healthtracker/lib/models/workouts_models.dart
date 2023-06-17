enum WorkoutType {
  jogging,
  weightlifting,
  yoga,
  cardio,
}

class Workout {
  final String name;
  final DateTime dateTime;
  Duration duration;
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

final List<Workout> workouts = [
  Workout(
    name: 'Morning Jog',
    dateTime: DateTime(2023, 6, 17, 6, 0),
    duration: Duration(minutes: 30),
    workoutType: WorkoutType.jogging,
    notes: 'Remember to stretch before jogging.',
  ),
  Workout(
    name: 'Weightlifting',
    dateTime: DateTime(2023, 6, 17, 14, 0),
    duration: Duration(hours: 1),
    workoutType: WorkoutType.weightlifting,
  ),
  Workout(
    name: 'Yoga Session',
    dateTime: DateTime(2023, 6, 18, 8, 30),
    duration: Duration(minutes: 60),
    workoutType: WorkoutType.yoga,
  ),
  Workout(
    name: 'Cardio Workout',
    dateTime: DateTime(2023, 6, 18, 17, 0),
    duration: Duration(minutes: 45),
    workoutType: WorkoutType.cardio,
  ),
];
