import 'package:flutter/material.dart';
import 'package:healthtracker/pages/home/widgets/activity.dart';
import 'package:healthtracker/pages/home/widgets/current.dart';
import 'package:healthtracker/pages/home/widgets/header.dart';
import 'package:healthtracker/widgets/bottom_navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppHeader(),
          CurrentPrograms(),
          RecentActivities(),
          BottomNavigation()
        ],
      ),
    );
  }
}
