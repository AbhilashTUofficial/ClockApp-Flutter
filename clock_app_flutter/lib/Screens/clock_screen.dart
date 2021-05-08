import 'dart:async';
import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/rendering.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnalogClock(
        decoration: BoxDecoration(
            border:
                Border.all(width: 4.0, color: Theme.of(context).primaryColor),
            color: Colors.transparent,
            shape: BoxShape.circle),
        width: MediaQuery.of(context).size.width * 0.8,
        isLive: true,
        hourHandColor: Theme.of(context).primaryColor,
        minuteHandColor: Theme.of(context).primaryColor,
        secondHandColor: Theme.of(context).primaryColor,
        showSecondHand: true,
        numberColor: Colors.black87,
        showNumbers: true,
        textScaleFactor: 1.8,
        showTicks: true,
        showDigitalClock: true,
        digitalClockColor: Theme.of(context).accentColor,
      ),
    );
  }
}
