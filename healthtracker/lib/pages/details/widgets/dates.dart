import 'package:flutter/material.dart';

class Dates extends StatelessWidget {
  const Dates({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DateBox(),
        DateBox(
          active: true,
        ),
      ],
    );
  }
}

class DateBox extends StatelessWidget {
  final bool active;
  const DateBox({
    this.active = false,
    super.key,
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
              )
            : null,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xffe1e1e1),
        ),
      ),
      child: Column(
        children: [
          Text(
            'Mon',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            '8',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
