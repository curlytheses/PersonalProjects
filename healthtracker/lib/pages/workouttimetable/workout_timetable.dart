import 'package:flutter/material.dart';
import 'package:healthtracker/pages/workouttimetable/Widgets/appbar.dart';
import 'package:healthtracker/pages/workouttimetable/Widgets/workoutlists.dart';
import '../../widgets/bottom_navigation.dart';

class WorkoutTimetablePage extends StatelessWidget {
  const WorkoutTimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar1(appBar: AppBar()),
      body: Column(
        children: const [
          WorkoutPrograms(),
          BottomNavigation(),
        ],
      ),
    );
  }
}


