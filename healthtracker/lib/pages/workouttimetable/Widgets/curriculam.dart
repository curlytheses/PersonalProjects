import 'dart:async';
import 'package:flutter/material.dart';

class Curriculam extends StatefulWidget {
  const Curriculam({super.key});

  @override
  State<Curriculam> createState() => _CurriculamState();
}

class _CurriculamState extends State<Curriculam> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 385,
      child: TimerWidget(),
    );
  }
}

class TimerWidget extends StatefulWidget {
  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget>
    with TickerProviderStateMixin {
  int _hours = 0;
  int _minutes = 0;
  int _seconds = 0;
  Timer? _timer;
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.easeInOut,
      ),
    );
  }

  void startTimer() {
    var totalSeconds = _hours * 3600 + _minutes * 60 + _seconds;
    if (totalSeconds > 0) {
      setState(() {
        _timer?.cancel();
        _timer = Timer.periodic(Duration(seconds: 1), (timer) {
          if (totalSeconds > 0) {
            setState(() {
              totalSeconds--;
              _hours = totalSeconds ~/ 3600;
              _minutes = (totalSeconds % 3600) ~/ 60;
              _seconds = totalSeconds % 60;
            });
          } else {
            _timer?.cancel();
          }
        });
      });
    }
  }

  void resetTimer() {
    _timer?.cancel();
    setState(() {
      _hours = 0;
      _minutes = 0;
      _seconds = 0;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<int> availableHours = List<int>.generate(24, (index) => index);
    final List<int> availableMinutes = List<int>.generate(60, (index) => index);
    final List<int> availableSeconds = List<int>.generate(60, (index) => index);

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          ScaleTransition(
            scale: _animation!,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              padding: EdgeInsets.all(90),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '${_hours.toString().padLeft(2, '0')}:${_minutes.toString().padLeft(2, '0')}:${_seconds.toString().padLeft(2, '0')}',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton<int>(
                value: _hours,
                onChanged: (value) {
                  setState(() {
                    _hours = value!;
                  });
                },
                items: availableHours.map((int hours) {
                  return DropdownMenuItem<int>(
                    value: hours,
                    child: Text('$hours hours'),
                  );
                }).toList(),
              ),
              DropdownButton<int>(
                value: _minutes,
                onChanged: (value) {
                  setState(() {
                    _minutes = value!;
                  });
                },
                items: availableMinutes.map((int minutes) {
                  return DropdownMenuItem<int>(
                    value: minutes,
                    child: Text('$minutes minutes'),
                  );
                }).toList(),
              ),
              DropdownButton<int>(
                value: _seconds,
                onChanged: (value) {
                  setState(() {
                    _seconds = value!;
                  });
                },
                items: availableSeconds.map((int seconds) {
                  return DropdownMenuItem<int>(
                    value: seconds,
                    child: Text('$seconds seconds'),
                  );
                }).toList(),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: startTimer,
                child: Text('Start', style: TextStyle(fontSize: 18)),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: resetTimer,
                child: Text('Reset', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
