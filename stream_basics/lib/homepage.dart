import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stream_basics/collection.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final StreamController _streamController = StreamController();

  addData()async{
    for(int i=0; i<10; i++){
      await Future.delayed(Duration(seconds: 1));

      _streamController.sink.add(i);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Basics'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _streamController.stream,
          builder: (context,AsyncSnapshot<dynamic> snapShot){
            if(snapShot.hasError){
              return Text("Oops! Error");
            }
            else if(snapShot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            return Text("${snapShot.data}");
          },
        ),
      ),
    );
  }
}