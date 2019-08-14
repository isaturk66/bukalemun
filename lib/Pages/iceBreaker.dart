import 'package:flutter/material.dart';

class IceBreaker extends StatefulWidget {
  IceBreaker({Key key}) : super(key: key);

  _IceBreakerState createState() => _IceBreakerState();
}

class _IceBreakerState extends State<IceBreaker> {



  Widget customAppB(){

     Color customAppBarColor = Colors.white;


    return Container(
        height: 65.0,
        width: double.infinity,
        color: customAppBarColor,
        child: Center(
          child: Container(
              padding: EdgeInsets.all(8),
              child: new Image.asset("assets/assets/bukalemunlogo.png"),
            )
          )
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[

          new Column(
            children: <Widget>[
              customAppB(),
            ],
          )
        ],
      ),
    );
  }
}