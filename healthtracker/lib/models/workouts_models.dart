import 'package:flutter/material.dart';

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
  final WorkoutType type;
  final String notes;
  final AssetImage image;

  Workout({
    required this.name,
    required this.dateTime,
    required this.duration,
    required this.type,
    this.notes = '',
    required this.image,
  });
}

final List<Workout> workouts = [
  Workout(
    name: 'Morning Jog',
    image: AssetImage('assets/images1.jpg'),
    dateTime: DateTime.now(),
    duration: Duration(minutes: 30),
    type: WorkoutType.jogging,
    notes: 'Remember to stretch before jogging.',
  ),
  Workout(
    name: 'Weightlifting',
    image: AssetImage('assets/images2.jpg'),
    dateTime: DateTime.now(),
    duration: Duration(hours: 1),
    type: WorkoutType.weightlifting,
  ),
  Workout(
    name: 'Yoga Session',
    image: AssetImage('assets/images1.jpg'),
    dateTime: DateTime.now(),
    duration: Duration(minutes: 60),
    type: WorkoutType.yoga,
  ),
  Workout(
    name: 'Cardio Workout',
    image: AssetImage('assets/images2.jpg'),
    dateTime: DateTime.now(),
    duration: Duration(minutes: 45),
    type: WorkoutType.cardio,
  ),
];
