import 'package:flutter/material.dart';

class RecentActivities extends StatelessWidget {
  const RecentActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Activities',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => ActivityItem(),
            ),
          )
        ],
      ),
    ));
  }
}

class ActivityItem extends StatelessWidget {
  const ActivityItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffe1e1e1),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffcff2ff),
            ),
            height: 35,
            width: 35,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images gym.jpg'),
                    fit: BoxFit.fill,
                  )),
            ),
          ),
          SizedBox(width: 20),
          Text(
            'Walking',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
          ),
          Icon(
            Icons.timer,
            size: 12,
          ),
          Text(
            '30 min',
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
          ),
          Icon(
            Icons.wb_sunny_outlined,
            size: 12,
          ),
          Text(
            '55 kkal',
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
