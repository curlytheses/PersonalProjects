import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      color: Color(0xfff8f8f8),
      child: IconTheme(
        data: IconThemeData(color: Color(0xffabadb4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Transform.translate(
              offset: Offset(0, -15),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
                child: Container(
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          colors: [Color(0xff92e2ff), Color(0xff1ebdf8)]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(3, 3),
                          blurRadius: 3,
                        )
                      ]),
                  child: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/details');
              },
              child: Icon(Icons.details),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/workouts');
              },
              child: Icon(Icons.list_alt_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
