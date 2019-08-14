import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../Components/ChatCell.dart';
import 'dart:math';

class FeedPage extends StatefulWidget {
  FeedPage({Key key}) : super(key: key);

  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  bool getChatBubble() {
    var rnd = new Random();
    if (rnd.nextInt(2) == 1) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: new ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return new ChatCell(
              name: "Ahmet Emre Gucer",
              conference: "MUNDP",
              ppImg: new Image.network(
                  "https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg"),
              chatBool: getChatBubble(),
            );
          }),
    );
  }
}
