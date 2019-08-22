import 'package:flutter/widgets.dart';

class Conference{
 //TODO: Fill This Model After Are Sure Of The [Scholl] OBJ
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