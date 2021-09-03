import 'package:flutter/material.dart';
import 'package:stream_basics/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Basics',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        accentColor: Colors.black,
        backgroundColor: Colors.black,
      ),
      home: MyHomePage(),
    );
  }
}
