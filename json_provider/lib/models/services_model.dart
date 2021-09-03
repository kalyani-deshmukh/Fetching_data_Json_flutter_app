import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Services with ChangeNotifier{
  Map<String, dynamic> _map = {};
  bool _error = false;
  String _errorMsg = '';
  
  Map<String, dynamic> get map => _map;
  bool get error => _error;
  String? get errorMsg => _errorMsg;


  Future<void> get fetchData async{
    final response =  await rootBundle.loadString('assets/list.json');

    try{
      _map = jsonDecode(response);
      print(_map);
      _error=false;
    }
    catch(e){
      _error=true;
      _errorMsg = e.toString();
      _map = {};
    }
    notifyListeners();
  }


  void initialValues(){
    _map={};
    _error=false;
    _errorMsg='';
    notifyListeners();
  }


}