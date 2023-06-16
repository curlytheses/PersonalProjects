import 'package:flutter/material.dart';
import '../../../models/helpers.dart';

class CurrentDates extends StatefulWidget {
  const CurrentDates({super.key});

  @override
  State<CurrentDates> createState() => _CurrentDateState();
}

class _CurrentDateState extends State<CurrentDates> {
  DateTime active = datetime[0].type;
  void _changeDate(DateTime newType) {
    setState(() {
      active = newType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        scrollDirection: Axis.horizontal,
        itemCount: datetime.length,
        itemBuilder: (context, index) {
          return DateBox(
            dateTimes: datetime[index],
            active: datetime[index].type == active,
            onTap: _changeDate,
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 20,
        ),
      ),
    );
  }
}

class DateBox extends StatelessWidget {
  final DateTimes dateTimes;
  final bool active;
  final Function(DateTime) onTap;
  const DateBox({
    super.key,
    required this.dateTimes,
    this.active = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 70,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      decoration: BoxDecoration(
        gradient: active
            ? LinearGradient(
                colors: [
                  Color(0xff92e2ff),
                  Color(0xff1ebdf8),
                ],
                begin: Alignment.topCenter,
              )
            : null,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xffe1e1e1),
        ),
      ),
      child: DefaultTextStyle.merge(
        style: active ? TextStyle(color: Colors.white) : null,
        child: Column(
          children: [
            Text(
              datetime[0].name,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              datetime[0].name,
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
