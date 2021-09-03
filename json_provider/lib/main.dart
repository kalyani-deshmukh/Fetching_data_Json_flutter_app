import 'package:flutter/material.dart';
import 'package:json_provider/models/services_model.dart';
import 'package:json_provider/pages/homepage.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => Services(),
        builder: (context, child){
          return HomePage();
        },
        ),
    );
  }
}