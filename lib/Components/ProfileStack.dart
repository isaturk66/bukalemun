import 'package:flutter/material.dart';

class ProfileStack extends StatefulWidget {
  final Image image;
  final String nameSurname;
  final String school;
  final String friendsNum;
  final String experiencesNum;

  const ProfileStack(
      {Key key,
      this.image,
      this.nameSurname,
      this.school,
      this.friendsNum,
      this.experiencesNum})
      : super(key: key);
  _ProfileStackState createState() => _ProfileStackState();
}

class _ProfileStackState extends State<ProfileStack> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final media = MediaQuery.of(context);
    return new Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            new Container(
              color: Color.fromRGBO(17, 172, 83, 1),
              width: media.size.width,
              height: media.size.height / 4,
              child: new Column(
                children: <Widget>[
                  new Container(
                    width: media.size.width,
                    height: media.size.height / 20,
                  ),
                  new Center(
                    child: new Text(
                      widget.nameSurname,
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                  new Center(
                    child: new Text(
                      widget.school,
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w100),
                    ),
                  ),
                  new Row(
                    children: <Widget>[
                      new Container(
                        width: media.size.width / 2,
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  media.size.width / 15, 5, 0, 5),
                              child: new Text(
                                widget.friendsNum,
                                style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w200),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  media.size.width / 15, 0, 0, 5),
                              child: new Text(
                                "Friends",
                                style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w200),
                              ),
                            ),
                          ],
                        ),
                      ),
                      new Container(
                        width: media.size.width / 2,
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0, 5, media.size.width / 15, 5),
                              child: new Text(
                                widget.experiencesNum,
                                style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w200),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  5, 0, media.size.width / 15, 5),
                              child: new Text(
                                "Experiences",
                                style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w200),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            new Container(
              height: media.size.width / 6,
              color: Colors.white,
            )
          ],
        ),
        new Positioned(
          bottom: 0,
          left: (media.size.width / 2) - (media.size.width / 6),
          child: new ClipRRect(
            borderRadius: new BorderRadius.circular(media.size.width / 1.5),
            child: new Container(
              width: media.size.width / 3,
              child: widget.image,
            ),
          ),
        ),
      ],
    );
  }
}
