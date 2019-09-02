import 'dart:convert';
import 'package:bukalemun/Model/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:bukalemun/Services/auth.dart' ;
import 'package:http/http.dart';

class AuthState extends ChangeNotifier{
  bool isLoggedIn = false;
  User _currentUser;

  get currentUser => _currentUser;
  set currentUser(var data){
    _currentUser = data;
  }

  initiateLogin(var _email,var _password) async{
    Response response = await Auth.login(email: _email,password: _password);
    if(response.statusCode == 200){
      _currentUser = new User.fromJson(json.decode(response.body));
      notifyListeners();
      return response.statusCode;
    }else return int.parse(response.body);    
  }
}

  


