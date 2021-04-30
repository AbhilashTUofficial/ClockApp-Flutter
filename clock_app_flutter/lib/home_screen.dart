import 'package:clock_app_flutter/export.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentTab = 0;
  final tabs = [Clock(), Timer(), StopWatch(), Alarm()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: GestureDetector(
              child: Icon(
                Icons.settings,
                size: 28,
                color: Theme.of(context).iconTheme.color,
              ),
              onTap: (){
                print("settings");
              },
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
              color: secondaryLightColor,
              size: 32,
            ),
            title: Text(
              "Clock",
              style: TextStyle(fontSize: 14),
            ),
            activeIcon: Icon(
              Icons.access_time_sharp,
              color: primaryColor,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.timer_10,
              color: secondaryLightColor,
              size: 32,
            ),
            title: Text(
              "Timer",
              style: TextStyle(fontSize: 14),
            ),
            activeIcon: Icon(
              Icons.timer_10,
              color: primaryColor,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.timer,
              color: secondaryLightColor,
              size: 32,
            ),
            title: Text(
              "Stop watch",
              style: TextStyle(fontSize: 14),
            ),
            activeIcon: Icon(
              Icons.timer,
              color: primaryColor,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.alarm,
              color: secondaryLightColor,
              size: 32,
            ),
            title: Text(
              "Alarm",
              style: TextStyle(fontSize: 14),
            ),
            activeIcon: Icon(
              Icons.alarm,
              color: primaryColor,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
