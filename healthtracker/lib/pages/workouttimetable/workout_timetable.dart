import 'package:flutter/material.dart';

class WorkoutTimetablePage extends StatelessWidget {
  const WorkoutTimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Timetable'),
      ),
      body: Center(
        child: Text(
          'Display your workout timetable here',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
