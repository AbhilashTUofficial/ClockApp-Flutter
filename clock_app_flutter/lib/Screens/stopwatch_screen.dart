import 'dart:async';

import 'package:clock_app_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:clock_app_flutter/export.dart';
import 'package:flutter/services.dart';

class StopWatch extends StatefulWidget {
  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  bool watchRunning = false;
  int lapsCount = 0;
  List lapsArr = <String>[" "];
  String stopWatchUserPrompt = "START";
  int _seconds = 00;
  int _minutes = 00;
  int _hours = 00;
  Timer _timer;
  String displayTime = "00 : 00 : 00";

  void clockTicking() {
    if (stopWatchUserPrompt == "PAUSE") {
      _timer = Timer.periodic(Duration(seconds: 1), (_timer) {
        setState(() {
          displayTime = "";

          if (_hours < 10) {
            displayTime += "0" + _hours.toString() + " : ";
          } else {
            displayTime += _hours.toString() + " : ";
          }
          if (_hours > 59) {
            _hours = 0;
            _hours++;
          }

          if (_minutes < 10) {
            displayTime += "0" + _minutes.toString() + " : ";
          } else {
            displayTime += _minutes.toString() + " : ";
          }
          if (_minutes > 59) {
            _minutes = 0;
            _hours++;
          }

          if (_seconds < 10) {
            displayTime += "0" + _seconds.toString();
          } else {
            displayTime += _seconds.toString();
          }
          _seconds++;
          if (_seconds > 59) {
            _seconds = 0;
            _minutes++;
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.transparent,
            width: (MediaQuery.of(context).size.width * 0.9),
            height: (MediaQuery.of(context).size.width * 0.6),
            child: ListView.builder(
                itemCount: lapsArr.length,
                itemBuilder: (context, int index) {
                  return index != 0
                      ? Container(
                          alignment: Alignment.center,
                          width: (MediaQuery.of(context).size.width * 0.9),
                          margin: EdgeInsets.symmetric(vertical: 5),
                          height: 42,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).accentColor,
                                  width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  index.toString(),
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black54),
                                ),
                              ),
                              Container(
                                child: Text(
                                  lapsArr[index],
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2,
                                      fontSize: 16),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(3),
                                    topRight: Radius.circular(3),
                                  ),
                                ),
                                child: Container(
                                  height: 42,
                                  width: 42,
                                  child: GestureDetector(
                                    child: Icon(
                                      Icons.copy,
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                      Clipboard.setData(ClipboardData(text: lapsArr[index]));
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      : Container();
                }),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            width: (MediaQuery.of(context).size.width * 0.9),
            height: (MediaQuery.of(context).size.width * 0.9) / 3 - 5,
            decoration: stopWatchContDec(context),
            child: Container(
              alignment: Alignment.center,
              width: (MediaQuery.of(context).size.width * 0.9) - 10,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.white60, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                displayTime,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 46,
                  decoration: timerContDec(context),
                  child: FlatButton(
                    splashColor: Theme.of(context).accentColor,
                    onPressed: () {
                      setState(() {
                        _seconds = 0;
                        _minutes = 0;
                        _hours = 0;
                      });
                    },
                    child: Text(
                      "RESET",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 46,
                  decoration: timerContDec(context),
                  child: FlatButton(
                    splashColor: Theme.of(context).accentColor,
                    onPressed: () {
                      setState(() {
                        stopWatchUserPrompt == "START"
                            ? stopWatchUserPrompt = "PAUSE"
                            : stopWatchUserPrompt = "START";
                        if (!watchRunning) {
                          clockTicking();
                          watchRunning = true;
                        } else if (watchRunning) {
                          watchRunning = false;
                          _timer.cancel();
                        }
                      });
                    },
                    child: Text(
                      stopWatchUserPrompt,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 46,
                  decoration: timerContDec(context),
                  child: FlatButton(
                    splashColor: Theme.of(context).accentColor,
                    onPressed: () {
                      print(displayTime);
                      setState(() {
                        lapsArr.add(displayTime);
                      });
                    },
                    child: Text(
                      "LAP",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
