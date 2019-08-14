import 'package:flutter/material.dart';

class HybridAuth extends StatelessWidget {
  const HybridAuth({Key key}) : super(key: key);

  Widget registerConferenceButton(BuildContext context) {
    final media = MediaQuery.of(context);
    final String title = "Register your Conference";
    final TextStyle titleStyle = new TextStyle(fontFamily: "HelveticaNeue",fontSize: 22,color: Colors.white,fontStyle: FontStyle.italic);
    return Container(
      width: media.size.width * (17 / 20),
      height: (media.size.width * (17 / 20)) / 6,
      decoration: BoxDecoration(
          border: Border.all(width: 2,color: Colors.white),
          borderRadius:
              BorderRadius.circular((media.size.width * (17 / 20)) / 6)),
      child: new Center(
        child: new Text(title,style: titleStyle,),
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    final media = MediaQuery.of(context);
    final String title = "Login";
    final TextStyle titleStyle = new TextStyle(fontFamily: "HelveticaNeue",fontSize: 22,color: Color.fromRGBO(101, 173, 132, 1),fontStyle: FontStyle.italic);

    return Container(
      width: media.size.width * (17 / 20),
      height: (media.size.width * (17 / 20)) / 6,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15),blurRadius: 0.5,spreadRadius: 0.5),],
          borderRadius:
              BorderRadius.circular((media.size.width * (17 / 20)) / 6)),
      child: new Center(
        child: new Text(title,style: titleStyle,),
      ),
    );
  }
  Widget registerButton(BuildContext context) {
    final media = MediaQuery.of(context);
    final String title = "Sign Up";
    final TextStyle titleStyle = new TextStyle(fontFamily: "HelveticaNeue",fontSize: 22,color: Color.fromRGBO(101, 173, 132, 1),fontStyle: FontStyle.italic);

    return Container(
      width: media.size.width * (17 / 20),
      height: (media.size.width * (17 / 20)) / 6,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15),blurRadius: 0.5,spreadRadius: 0.5),],

        color: Colors.white,
          borderRadius:
              BorderRadius.circular((media.size.width * (17 / 20)) / 6)),
              child: new Center(
        child: new Text(title,style: titleStyle,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          new Container(
            width: media.size.width,
            decoration: new BoxDecoration(
                image: new DecorationImage(
              fit: BoxFit.fitWidth,
              alignment: FractionalOffset.topCenter,
              image: new AssetImage("assets/assets/hybridBackGround.png"),
            )),
          ),
          Column(
            children: <Widget>[
              //? Brand Section
              new Expanded(
                  flex: 2,
                  child: new Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: new Image.asset("assets/assets/hybridBrand.png"),
                    ),
                  )),

              //? Spacing
              new Expanded(
                flex: 1,
                child: new Container(),
              ),

              ///? Down Menu
              new Expanded(
                flex: 3,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    loginButton(context),
                    new Container(height: (media.size.width * (17 / 20))/ 12,),
                    registerButton(context),
                    new Container(height: (media.size.width * (17 / 20))/ 12,),
                    registerConferenceButton(context),

                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
