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
          CurrentPrograms(),
          BottomNavigation(),
        ],
      ),
    );
  }
}

/*class WorkoutTimetablePageState extends State<WorkoutTimetablePage> {
  List<Workout> workouts = [
    Workout(
      name: 'Morning Jog',
      dateTime: DateTime(2023, 6, 17, 6, 0), // Sample date and time
      duration: Duration(minutes: 30),
      workoutType: WorkoutType.jogging,
      notes: 'Remember to stretch before jogging.',
    ),
    Workout(
      name: 'Weightlifting',
      dateTime: DateTime(2023, 6, 17, 14, 0), // Sample date and time
      duration: Duration(hours: 1),
      workoutType: WorkoutType.weightlifting,
    ),
    Workout(
      name: 'Yoga Session',
      dateTime: DateTime(2023, 6, 18, 8, 30), // Sample date and time
      duration: Duration(minutes: 60),
      workoutType: WorkoutType.yoga,
    ),
    Workout(
      name: 'Cardio Workout',
      dateTime: DateTime(2023, 6, 18, 17, 0), // Sample date and time
      duration: Duration(minutes: 45),
      workoutType: WorkoutType.cardio,
    ),
  ];

  void _setWorkoutDuration(int index, Duration duration) {
    setState(() {
      workouts[index].duration = duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Timetable'),
      ),
      body: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          final workout = workouts[index];
          return ListTile(
            title: Text(workout.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(workout.dateTime.toString()),
                Row(
                  children: [
                    Text('Duration: '),
                    Text(
                      workout.duration.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                    'Workout Type: ${workout.workoutType.toString().split('.').last}'),
                Slider(
                  min: 0,
                  max: 120,
                  divisions: 24,
                  value: workout.duration.inMinutes.toDouble(),
                  onChanged: (value) {
                    _setWorkoutDuration(
                        index, Duration(minutes: value.toInt()));
                  },
                ),
              ],
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}*/

