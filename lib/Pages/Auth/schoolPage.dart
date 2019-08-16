import 'package:flutter/material.dart';

class SchoolPage extends StatelessWidget {
  final String nameSurname;
  final String username;
  final String password;
  final String email;

  SchoolPage(this.email, this.nameSurname, this.password, this.username);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          new Text("Name/Surname: " + nameSurname),
          new Text("E-mail " + email),
          new Text("Username " + username),
          new Text("Password " + password),
        ],
      ),
    );
  }
  
}