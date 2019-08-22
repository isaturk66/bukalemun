import 'package:flutter/material.dart';

import 'conferenceModel.dart';

class User{
    final String id,username,fullname,email,school;
    final List<Experience> experiences;
    final List <FriendObject> friends;

const User({
      @required this.id,
      @required this.username,
      @required this.email,
      @required this.fullname,
      @required this.school,
      @required this.experiences,
      @required this.friends,
    });
factory User.fromJson(Map<String, dynamic> json){

  var rawExplist = json['experiences']as List;
  var rawFriendlist = json['friends']as List;
  List<Experience> experineceList = rawExplist.map((i) => Experience.fromJson(i)).toList();
  List<FriendObject> friendList = rawExplist.map((i) => FriendObject.fromJson(i)).toList();



    return User(
      id : json['_id'],
      username : json['userName'],
      email : json['email'],
      fullname : json['fullName'],
      school : json['school'],
      experiences : experineceList,
      friends : friendList,
    );
  }



    
}


class FriendObject{
  final String id;
  final String friendID;

   const FriendObject({
      @required this.id,
      @required this.friendID,
   });

  factory FriendObject.fromJson(Map<String, dynamic> json){
    return FriendObject(
     id: json['_id'],
     friendID: json['friendID'],
    );
  }

}