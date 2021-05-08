import 'package:clock_app_flutter/export.dart';
import 'package:clock_app_flutter/main.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentTab = 0;
  final tabs = [Clock(), TimerScreen(), StopWatch(), Alarm()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.settings,
              size: 28,
              color: Color.fromRGBO(254,60,114,1),
            ),
          )
        ],
      ),
      body: tabs[_currentTab],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3.0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.access_time_sharp,
              size: 32,
            ),
            title: Text(
              "Clock",
              style: TextStyle(fontSize: 14,),
            ),
            activeIcon: Icon(
              Icons.access_time_sharp,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.timer_10,
              size: 32,
            ),
            title: Text(
              "Timer",
              style: TextStyle(fontSize: 14),
            ),
            activeIcon: Icon(
              Icons.timer_10,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.timer,
              size: 32,
            ),
            title: Text(
              "Stop watch",
              style: TextStyle(fontSize: 14),
            ),
            activeIcon: Icon(
              Icons.timer,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.alarm,
              size: 32,
            ),
            title: Text(
              "Alarm",
              style: TextStyle(fontSize: 14),
            ),
            activeIcon: Icon(
              Icons.alarm,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
