import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthtracker/login_page.dart';
import 'package:healthtracker/pages/WorkoutTimetable/workout_timetable.dart';
import 'package:healthtracker/pages/details/details.dart';
import 'package:healthtracker/pages/home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fittness Tracker',
      theme: ThemeData(
          fontFamily: 'Roboto',
          textTheme: TextTheme(
              displayLarge: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ))),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/details': (context) => DetailsPage(),
        '/workouts': (context) => WorkoutTimetablePage(),
        '/login': (context) => SignInScreen(),
      },
      initialRoute: '/login',
    );
  }
}
