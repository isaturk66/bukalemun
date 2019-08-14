import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DebateCard extends StatefulWidget {
  _DebateCardState createState() => _DebateCardState();
}

class _DebateCardState extends State<DebateCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final media = MediaQuery.of(context);
    return ClipRRect(
          borderRadius: new BorderRadius.circular(60.0),
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 7, 15, 7),
            color: Color.fromRGBO(247, 247, 247, 1),
            child: new Row(
              children: <Widget>[
                Container(
                  width: media.size.width * 0.70,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.fromLTRB(15, 15, 5, 5),
                          child: new Text(
                            "MUNDP Nasildi sizce?",
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            style: new TextStyle(
                                color: Color.fromRGBO(17, 172, 83, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.w100,
                                decoration: null),
                          )),
                      new Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 5, 5),
                        child: new Text(
                          "    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Netus et malesuada fames ac. Velit aliquet sagittis id consectetur purus ut. Amet nisl suscipit adipiscing bibendum est ultricies integer quis. Mauris vitae ultricies leo integer malesuada nunc vel risus. At risus viverra adipiscing at in tellus integer feugiat scelerisque. Vehicula ipsum a arcu cursus vitae. Gravida arcu ac tortor dignissim convallis aenean et. Augue eget arcu dictum varius duis at consectetur. Dictumst quisque sagittis purus sit amet volutpat consequat. Vitae nunc sed velit dignissim sodales ut eu. Donec ac odio tempor orci dapibus ultrices in. Sed turpis tincidunt id aliquet risus feugiat. Sit amet mattis vulputate enim nulla aliquet porttitor. Eget lorem dolor sed viverra ipsum nunc aliquet bibendum enim. Massa ultricies mi quis hendrerit. Dictum sit amet justo donec enim diam vulputate ut. Aliquam malesuada bibendum arcu vitae elementum. Libero id faucibus nisl tincidunt eget. Mi sit amet mauris commodo quis imperdiet.",
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: new TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w200),
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 5, 5),
                        child: new Text(
                          "@emregucerr",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: new TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                              fontWeight: FontWeight.w100),
                        ),
                      ),
                    ],
                  ),
                ),
                new Column(
                  children: <Widget>[
                    Container(
                      width: media.size.width / 5.5,
                      child: Center(
                        child: new CupertinoButton(
                          onPressed: () {},
                          child: new Image.asset("assets/assets/upBtn.png"),
                        ),
                      ),
                    ),
                    Container(
                      width: media.size.width / 5.5,
                      child: Center(
                        child: new Text(
                          "6462",
                          style: new TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w100),
                        ),
                      ),
                    ),
                    Container(
                      width: media.size.width / 5.5,
                      child: Center(
                        child: new CupertinoButton(
                          onPressed: () {},
                          child: new Image.asset("assets/assets/downBtn.png"),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
  }

}