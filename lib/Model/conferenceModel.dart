import 'package:bukalemun/Model/schoolsModel.dart';
import 'package:flutter/widgets.dart';

class Conference{
  final String id;
  final String name;
  final SchoolModel host;
  final String website;
  final String hyperlink;
  final DateTime date;
  final String icon;

  Conference({
    @required this.id,
    @required this.name,
    @required this.hyperlink,
    this.website,
    this.date,
    this.icon,
    this.host 
  });

}
class Experience{
  String conferenceID,role,id;
  Experience({
    @required this.id,
    @required this.conferenceID,
    this.role
  });

  factory Experience.fromJson(Map<String, dynamic> json){
    return Experience(
     id: json['_id'],
     conferenceID: json['conferenceID'],
     role:  json['role'],
    );
  }
}

