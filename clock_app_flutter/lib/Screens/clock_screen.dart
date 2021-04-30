import 'dart:async';
import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  var _dayOfTheMonth = DateTime.now().day;
  var _weekOfTheMonth = DateTime.now().weekday;
  var _monthOfTheYear=DateTime.now().month;
  String _week;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeOfDay.minute != TimeOfDay.now().minute) {
        setState(() {
          _timeOfDay = TimeOfDay.now();
        });
      }
      if (_weekOfTheMonth == 1) {
        _week = "Monday";
      } else if (_weekOfTheMonth == 2) {
        _week = "Tuesday";
      } else if (_weekOfTheMonth == 3) {
        _week = "Wednesday";
      } else if (_weekOfTheMonth == 4) {
        _week = "Thursday";
      } else if (_weekOfTheMonth == 5) {
        _week = "Friday";
      } else if (_weekOfTheMonth == 6) {
        _week = "Saturday";
      } else if (_weekOfTheMonth == 7) {
        _week = "Sunday";
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String _period = _timeOfDay.period == DayPeriod.am ? "AM" : "PM";
    return Center(
      child: Column(
        children: [
          Text("$_dayOfTheMonth ,$_week"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${_timeOfDay.hour}:${_timeOfDay.minute}",
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(width: 5),
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  _period,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
