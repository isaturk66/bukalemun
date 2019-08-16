import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bukalemun/Constants/routerConstants.dart';

class LoginPage extends StatelessWidget {
  static final _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    // TODO: implement build
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new Column(
        children: <Widget>[
          new Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  new Stack(
                    children: <Widget>[
                      Container(
                          width: media.size.width,
                          child:
                              new Image.asset("assets/assets/loginHeader.png")),
                      Positioned(
                        left: (media.size.width - media.size.width * 0.65) / 2,
                        top: 100,
                        child: Container(
                            width: media.size.width * 0.65,
                            child: new Image.asset(
                                "assets/assets/bukalemunlogoLight.png")),
                      )
                    ],
                  ),
                  new Container(
                    width: media.size.width,
                    height: media.size.height / 2,
                  )
                ],
              ),
              Positioned(
                left: (media.size.width - media.size.width * 0.85) / 2,
                top: (media.size.height - media.size.height * 0.55) / 2,
                child: Container(
                  width: media.size.width * 0.85,
                  height: media.size.height * 0.65,
                  decoration: new BoxDecoration(boxShadow: [
                    new BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10.0,
                        offset: Offset(5, 10)),
                  ]),
                  child: new Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Container(
                          child: new Column(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                                  width: media.size.width,
                                  child: new Text(
                                    "Login",
                                    style: new TextStyle(
                                        color: Color.fromRGBO(17, 172, 83, 1),
                                        fontSize: 28),
                                  )),
                              Container(
                                  margin: EdgeInsets.fromLTRB(25, 25, 25, 0),
                                  child: new Theme(
                                      data: new ThemeData(
                                          primaryColor:
                                              Color.fromRGBO(17, 172, 83, 1)),
                                      child: new TextFormField(
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'This place cannot be empty';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            labelText:
                                                'Enter your username or e-mail',
                                          ),
                                          cursorColor:
                                              Color.fromRGBO(17, 172, 83, 1)))),
                              Container(
                                  margin: EdgeInsets.fromLTRB(25, 25, 25, 0),
                                  child: new Theme(
                                      data: new ThemeData(
                                          primaryColor:
                                              Color.fromRGBO(17, 172, 83, 1)),
                                      child: new TextFormField(
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'This place cannot be empty';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            labelText: 'Enter your password',
                                          ),
                                          cursorColor:
                                              Color.fromRGBO(17, 172, 83, 1)))),
                              loginButton(context, _formKey)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

Widget loginButton(BuildContext context, GlobalKey<FormState> _formKey) {
  final media = MediaQuery.of(context);
  final String title = "Login";
  final TextStyle titleStyle = new TextStyle(
      fontFamily: "HelveticaNeue",
      fontSize: 22,
      color: Colors.white,
      fontWeight: FontWeight.w100);

  return Container(
    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
    child: SizedBox(
      width: media.size.width * (16 / 20),
      height: (media.size.width * (17 / 20)) / 7,
      child: MaterialButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            // If the form is valid, display a Snackbar.
            Navigator.pushNamed(context, PreIndex);
          }
        },
        child: Container(
          width: media.size.width * (17 / 20),
          height: (media.size.width * (17 / 20)) / 7,
          decoration: BoxDecoration(
              color: Color.fromRGBO(17, 172, 83, 1),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 0.5,
                    spreadRadius: 0.5),
              ],
              borderRadius:
                  BorderRadius.circular((media.size.width * (17 / 20)) / 6)),
          child: new Center(
            child: new Text(
              title,
              style: titleStyle,
            ),
          ),
        ),
      ),
    ),
  );
}
