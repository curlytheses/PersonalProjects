import 'package:flutter/material.dart';
import '../../../models/helpers.dart';

class Dates extends StatefulWidget {
  const Dates({Key? key}) : super(key: key);

  @override
  _DatesState createState() => _DatesState();
}

class _DatesState extends State<Dates> {
  int activeIndex = 3;

  @override
  Widget build(BuildContext context) {
    List<DateBox> dateBoxes = [];

    DateTime date = DateTime.now().subtract(const Duration(days: 3));

    for (int i = 0; i < 6; i++) {
      dateBoxes.add(
        DateBox(
          date: date,
          active: i == activeIndex,
          onTap: () => _onDateBoxTapped(i),
        ),
      );
      date = date.add(const Duration(days: 1));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: dateBoxes,
      ),
    );
  }

  void _onDateBoxTapped(int index) {
    setState(() {
      activeIndex = index;
    });
  }
}

class DateBox extends StatelessWidget {
  final bool active;
  final DateTime date;
  final VoidCallback onTap;

  const DateBox({
    Key? key,
    this.active = false,
    required this.date,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 70,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        decoration: BoxDecoration(
          gradient: active
              ? const LinearGradient(
                  colors: [Color(0xff92e2ff), Color(0xff1ebdf8)],
                  begin: Alignment.topCenter,
                )
              : null,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xffe1e1e1),
          ),
        ),
        child: DefaultTextStyle.merge(
          style: active ? const TextStyle(color: Colors.white) : null,
          child: Column(
            children: [
              Text(
                daysOfWeek[date.weekday]!,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                date.day.toString().padLeft(2, '0'),
                style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
