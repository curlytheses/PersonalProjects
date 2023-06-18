import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthtracker/pages/home_page.dart';

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
      home: HomeScreen(),
    );
  }
}
