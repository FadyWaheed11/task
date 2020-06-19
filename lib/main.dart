import 'package:flutter/material.dart';
import 'package:task1/ui/home_page.dart';


void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        accentColor: Colors.amberAccent,
        fontFamily: 'Cairo',
        textTheme: TextTheme(
          headline1: TextStyle(
              color: Color(0xff535670),
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
          headline2: TextStyle(
              color: Color(0xff535670).withOpacity(0.7),
              fontSize: 16.0,
              fontWeight: FontWeight.bold),
          bodyText1: TextStyle(
            color: Color(0xff535670).withOpacity(0.7),
            fontSize: 14.0,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
