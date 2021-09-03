import 'package:flutter/material.dart';
import 'package:json_provider/models/services_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<Services>().fetchData;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: (){
              context.read<Services>().initialValues();
              context.read<Services>().fetchData;
            },
            ),
        ],
        title: Text('Json data -> Provider'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<Services>().fetchData;
        },
        child: Center(
          child: Consumer<Services>(builder: (context, value, child) {
            return (value.map.length == 0 && value.error)
                ? CircularProgressIndicator()
                : value.error
                    ? Text(
                        'Something Went Wrong. ${value.errorMsg}',
                        textAlign: TextAlign.center,
                      )
                    : ListView.builder( 
                      itemCount: value.map.length,
                      itemBuilder: (BuildContext context, int index){
                           return ServicesTile(map: value.map[index] ?? {});
                      }
                    );
          }),
        ),
      ),
    );
  }
}

class ServicesTile extends StatelessWidget {
  const ServicesTile({ Key? key,  required this.map }) : super(key: key);
  final Map<String, dynamic>  map;
  

  @override
  Widget build(BuildContext context) {
    return  Column(
          children: [
            ListTile(
              leading: Text(
                '${map['leading']}',
                style: TextStyle(fontFamily: 'MaterialIcons'),
              ),
              title: Text(map['title']),
             // trailing: check? Icon(Icons.check_box) : Icon(Icons.check_box_outline_blank),
            ),
          ],
        );
  }
}
