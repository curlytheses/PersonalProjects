import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:async';

void main() {
  runApp(
    MaterialApp(home: ClockApp()),
  );
}

class ClockApp extends StatefulWidget {
  const ClockApp({super.key});

  @override
  State<ClockApp> createState() => _ClockAppState();
}

class _ClockAppState extends State<ClockApp> {
  double percent = 0;
  static int TimeinMinute = 25;
  int TimeinSec = TimeinMinute * 60;
  late Timer timer;
  _StartTimer() {
    TimeinMinute = 25;
    int Time = TimeinMinute * 60;
    double SecPercent = (Time / 100);
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (Time > 0) {
          Time--;
          if (Time % 60 == 0) {
            TimeinMinute--;
          }
          if (Time % SecPercent == 0) {
            if (percent > 1) {
              percent += 0.01;
            } else {
              percent = 1;
            }
          }
        } else {
          percent = 0;
          TimeinMinute = 25;
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff1542bf), Color(0xff51a8ff)],
                  begin: FractionalOffset(0.5, 1))),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text(
                  "Clock",
                  style: TextStyle(color: Colors.white, fontSize: 40.0),
                ),
              ),
              Expanded(
                child: CircularPercentIndicator(
                  circularStrokeCap: CircularStrokeCap.round,
                  percent: percent,
                  animation: true,
                  animateFromLastPercent: true,
                  radius: 250.0,
                  lineWidth: 20.0,
                  progressColor: Colors.white,
                  center: Text(
                    "$TimeinMinute",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 80.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0))),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Study Timer",
                                      style: TextStyle(
                                        fontSize: 30.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "25",
                                      style: TextStyle(
                                        fontSize: 80.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Pause Timer",
                                      style: TextStyle(
                                        fontSize: 30.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "5",
                                      style: TextStyle(
                                        fontSize: 80.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 28.0),
                          child: OutlinedButton(
                              onPressed: _StartTimer,
                              //color: Colors.blue,
                              //shape: RoundedRectangleBorder(
                              //borderRadius: BorderRadius.circular(100.0),
                              //),
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  "Start Studying",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
