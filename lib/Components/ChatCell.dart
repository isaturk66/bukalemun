import 'package:flutter/material.dart';

class ChatCell extends StatefulWidget {
  final Image ppImg;
  final String name;
  final String conference;
  final bool chatBool;

  const ChatCell({
    Key key,
    this.ppImg,
    this.name,
    this.conference,
    this.chatBool,
  }) : super(key: key);

  _ChatCellState createState() => _ChatCellState();
}

class _ChatCellState extends State<ChatCell> {
  Image getChatBool() {
    if (widget.chatBool) {
      return new Image.asset("assets/assets/filledChat.png");
    }
    else {
      return new Image.asset("assets/assets/emptyChat.png");
    }
  }
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    // TODO: implement build
    return new Container(
      margin: EdgeInsets.fromLTRB(20, 0, 15, 15),
      child: new Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: new BorderRadius.circular(30),
            child: new Container(
                width: 50,
                child: widget.ppImg),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 5),
                child: new Text(
                  widget.name,
                  style:
                      new TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
                ),
              ),
              new Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 5),
                child: new Text(
                  widget.conference,
                  style: new TextStyle(
                      fontWeight: FontWeight.w100,
                      color: Color.fromRGBO(17, 172, 83, 1)),
                ),
              ),
            ],
          ),
          new Container(
              margin: EdgeInsets.fromLTRB(media.size.width / 3.75, 0, 0, 0),
              width: 20,
              child: getChatBool())
        ],
      ),
    );
  }
}
