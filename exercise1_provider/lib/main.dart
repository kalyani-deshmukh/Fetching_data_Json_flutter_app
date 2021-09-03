import 'dart:convert';

import 'package:exercise1_provider/services_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context, data){
            if(data.hasError){
              return Center(child: Text('${data.error}'));
            }
            else if(data.hasData){
              var items = data.data as List<ServicesModel>;
              return ListView.builder(
                itemCount: items.length,
        itemBuilder: (BuildContext context, int index){
          var service = items[index].title;
          var icons = items[index].leading;
          //String service_icon = _services[index]["leading"];
          var check = items[index].trailing ?? false;

        return Column(
          children: [
            ListTile(
              leading: Text(
                icons!,
                style: TextStyle(fontFamily: 'MaterialIcons'),
              ),
              title: Text(service!),
              trailing: check? Icon(Icons.check_box) : Icon(Icons.check_box_outline_blank),
              //trailing: ServiceCheckbox(),
            ),
          ],
        );
      }
                );
            }
            else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
          ),
      ),
    );
  }


  Future<List<ServicesModel>> ReadJsonData() async {
    final jsondata = await rootBundle.loadString('assets/list.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => ServicesModel.fromJson(e)).toList();
  }
}


