import 'package:flutter/material.dart';
import 'export.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Clock App Flutter",
      theme: ThemeData(
        primaryColor: Color.fromRGBO(254,60,114,1),
        accentColor: Color.fromRGBO(254,60,114,0.6),
        unselectedWidgetColor: Color.fromRGBO(66,66,66,0.7),
        splashColor: Color.fromRGBO(254,60,114,0.2),
      ),
      home:Home(),
    );
  }
}


