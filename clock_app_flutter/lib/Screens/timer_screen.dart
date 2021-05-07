import 'dart:async';

import 'package:clock_app_flutter/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clock_app_flutter/export.dart';
import 'package:flutter/services.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  Timer _timer;
  final hoursCrl = TextEditingController();
  final mintsCrl = TextEditingController();
  final secsCrl = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    hoursCrl.dispose();
    mintsCrl.dispose();
    secsCrl.dispose();
    super.dispose();
  }

  String hours = "00";
  String mints = "00";
  String secs = "00";
  double timerPercentage = 0;
  bool timeSet = false;
  bool canEditTimer = true;

  void startTimer() {
    timerPercentage = 0;
    int timeInHours = int.parse(hoursCrl.text);
    print(timeInHours);
    int timeInMints = int.parse(mintsCrl.text);
    int timeInSecs = int.parse(secsCrl.text);
    int increment =
        ((timeInSecs * 1000) + (timeInMints * 60000) + (timeInHours )/100)
            .round();
    print(increment);
    _timer = Timer.periodic(Duration(milliseconds: increment), (_timer) {
      setState(() {
        print(timerPercentage);
        if (timerPercentage > 1) {
          _timer.cancel();
        }
        timerPercentage += 0.01;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        timeSet
            ? Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.8,
                child: CircularProgressIndicator(
                  value: timerPercentage,
                  strokeWidth: 20,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor),
                ),
              )
            : Container(),
        Container(
          //color: Colors.redAccent,
          width: MediaQuery.of(context).size.width * 0.9,
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                width: (MediaQuery.of(context).size.width * 0.9) / 3 - 5,
                height: (MediaQuery.of(context).size.width * 0.9) / 3 - 5,
                decoration: timerContDec(context),
                child: Container(
                  alignment: Alignment.center,
                  width: 80,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white60, width: 1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextField(
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        showCursor: false,
                        controller: hoursCrl,
                        inputFormatters: [LengthLimitingTextInputFormatter(2)],
                        decoration: InputDecoration.collapsed(
                            hintText: hours,
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold)),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "HOURS",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: (MediaQuery.of(context).size.width * 0.9) / 3 - 5,
                height: (MediaQuery.of(context).size.width * 0.9) / 3 - 5,
                decoration: timerContDec(context),
                child: Container(
                  alignment: Alignment.center,
                  width: 80,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white60, width: 1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextField(
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        showCursor: false,
                        controller: mintsCrl,
                        inputFormatters: [LengthLimitingTextInputFormatter(2)],
                        decoration: InputDecoration.collapsed(
                            hintText: mints,
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold)),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "MINTS",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: (MediaQuery.of(context).size.width * 0.9) / 3 - 5,
                height: (MediaQuery.of(context).size.width * 0.9) / 3 - 5,
                decoration: timerContDec(context),
                child: Container(
                  alignment: Alignment.center,
                  width: 80,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white60, width: 1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextField(
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        showCursor: false,
                        controller: secsCrl,
                        inputFormatters: [LengthLimitingTextInputFormatter(2)],
                        decoration: InputDecoration.collapsed(
                            hintText: secs,
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold)),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "SECS",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  width: 120,
                  height: 46,
                  decoration: timerContDec(context),
                  child: Text(
                    "RESET",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 18),
                  ),
                ),
                onTap: () {
                  setState(() {
                    timeSet = false;
                    hoursCrl.text = "00";
                    mintsCrl.text = "00";
                    secsCrl.text = "00";
                    timerPercentage = 0;
                    canEditTimer = true;
                  });
                },
              ),
              GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    width: 120,
                    height: 46,
                    decoration: timerContDec(context),
                    child: Text(
                      timeSet ? "STOP" : "START",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          fontSize: 18),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      timeSet ? timeSet = false : timeSet = true;
                      timeSet ? canEditTimer = false : canEditTimer = true;
                      if (timeSet) {
                        startTimer();
                      } else {
                        timerPercentage = 0;
                      }
                    });
                  }),
            ],
          ),
        )
      ],
    ));
  }
}
