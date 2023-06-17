import 'package:flutter/material.dart';
import 'package:healthtracker/models/workouts_models.dart';

class WorkoutPrograms extends StatefulWidget {
  const WorkoutPrograms({super.key});

  @override
  State<WorkoutPrograms> createState() => _WorkoutProgramsState();
}

class _WorkoutProgramsState extends State<WorkoutPrograms> {
  WorkoutType active = workouts[0].type;
  void _changeProgram(WorkoutType newType) {
    setState(() {
      active = newType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Current Workouts',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 100,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            scrollDirection: Axis.horizontal,
            itemCount: workouts.length,
            itemBuilder: (context, index) {
              return WorkOut(
                workouts: workouts[index],
                active: workouts[index].type == active,
                onTap: _changeProgram,
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              width: 20,
            ),
          ),
        )
      ],
    );
  }
}

class WorkOut extends StatelessWidget {
  final Workout workouts;
  final bool active;
  final Function(WorkoutType) onTap;
  const WorkOut({
    super.key,
    required this.workouts,
    this.active = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(workouts.type);
      },
      child: Container(
        height: 160,
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                active
                    ? Color(0xff1ebdf8).withOpacity(0.8)
                    : Colors.white.withOpacity(0.8),
                BlendMode.lighten,
              ),
              image: workouts.image,
              fit: BoxFit.cover),
        ),
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(15),
        child: DefaultTextStyle.merge(
          style: TextStyle(
            color: active ? Colors.white : Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(workouts.name),
              Column(
                children: [
                  Row(
                    children: [
                      Text(workouts.dateTime.toString()),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.timer,
                        size: 10,
                        color: active ? Colors.white : Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(workouts.duration.toString()),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
