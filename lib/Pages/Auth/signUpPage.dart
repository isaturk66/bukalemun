import 'package:bukalemun/Constants/routerConstants.dart' as prefix1;
import 'package:bukalemun/Model/args/schoolNavigatonObject.dart';
import 'package:bukalemun/Pages/Auth/schoolPage.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:bukalemun/Constants/routerConstants.dart';
import './schoolPage.dart';

class SignUpPage extends StatefulWidget {
  static final _formKey = new GlobalKey<FormState>();

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final passwordAgainController = TextEditingController();

  ScrollController _scroll;

  FocusNode _focus = new FocusNode();

  @override
  void initState() {
    super.initState();
    _scroll = new ScrollController();
    _focus.addListener(() {
      _scroll.jumpTo(-1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    // TODO: implement build
    return new Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(media.size.width * 0.05,
              70, 0, 0),
          width: media.size.width * 0.9,
          child: Form(
            key: SignUpPage._formKey,
            child: Container(
              child: new Column(
                children: <Widget>[
                  Container(
                    width: media.size.width * 0.55,
                    child: Image.asset("assets/assets/bukalemunlogo.png"),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                      width: media.size.width,
                      child: new Text(
                        "Sign Up",
                        style: new TextStyle(
                            color: Color.fromRGBO(17, 172, 83, 1),
                            fontSize: 28),
                      )),
                  Container(
                      margin: EdgeInsets.fromLTRB(25, 25, 25, 0),
                      child: new Theme(
                          data: new ThemeData(
                              primaryColor: Color.fromRGBO(17, 172, 83, 1)),
                          child: new TextFormField(
                              autofocus: true,
                              controller: nameController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'This place cannot be empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Enter your name and surname',
                              ),
                              cursorColor: Color.fromRGBO(17, 172, 83, 1)))),
                  Container(
                      margin: EdgeInsets.fromLTRB(25, 25, 25, 0),
                      child: new Theme(
                          data: new ThemeData(
                              primaryColor: Color.fromRGBO(17, 172, 83, 1)),
                          child: new TextFormField(
                              autofocus: true,
                              controller: emailController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'This place cannot be empty';
                                }
                                if (!(value.contains('@'))) {
                                  return 'Enter a valid e-mail adress';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Enter your e-mail',
                              ),
                              cursorColor: Color.fromRGBO(17, 172, 83, 1)))),
                  Container(
                      margin: EdgeInsets.fromLTRB(25, 25, 25, 0),
                      child: new Theme(
                          data: new ThemeData(
                              primaryColor: Color.fromRGBO(17, 172, 83, 1)),
                          child: new TextFormField(
                              autofocus: true,
                              controller: usernameController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'This place cannot be empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Enter your username',
                              ),
                              cursorColor: Color.fromRGBO(17, 172, 83, 1)))),
                  Container(
                      margin: EdgeInsets.fromLTRB(25, 25, 25, 0),
                      child: new Theme(
                          data: new ThemeData(
                              primaryColor: Color.fromRGBO(17, 172, 83, 1)),
                          child: new TextFormField(
                              autofocus: true,
                              controller: passwordController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'This place cannot be empty';
                                }
                                if (value.length < 6) {
                                  return 'Minimun 6 characters';
                                }
                                if (value != passwordAgainController.text) {
                                  return 'Two passwords are not matching';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Enter your password',
                              ),
                              cursorColor: Color.fromRGBO(17, 172, 83, 1)))),
                  Container(
                      margin: EdgeInsets.fromLTRB(25, 25, 25, 0),
                      child: new Theme(
                          data: new ThemeData(
                              primaryColor: Color.fromRGBO(17, 172, 83, 1)),
                          child: new TextFormField(
                              autofocus: true,
                              controller: passwordAgainController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'This place cannot be empty';
                                }
                                if (value.length < 6) {
                                  return 'Minimun 6 characters';
                                }
                                if (value != passwordController.text) {
                                  return 'Two passwords are not matching';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Enter your password again',
                              ),
                              cursorColor: Color.fromRGBO(17, 172, 83, 1)))),
                  SubmitButton(
                      SignUpPage._formKey,
                      nameController.text,
                      usernameController.text,
                      emailController.text,
                      passwordController.text)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {

  var snack404 = SnackBar(content: Text('Bilinmeyen Bir Hata Oluştu. Yakında Tekrar Denersin Artık'));
  var snack900 = SnackBar(content: Text('Bu e-mail halihazırda kullanılıyor, belki kardeşin çalmıştır'));

  final GlobalKey<FormState> _formKey;
  final String nameSurname,username,email,password;
  SubmitButton(this._formKey,this.nameSurname,this.username,this.email,this.password);
_navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.pushNamed(
      context,
      // Create the SelectionScreen in the next step.
      prefix1.SchoolPage,
      arguments: SchoolNavigationObject(
        nameSurname: nameSurname,
        email: email,
        password: password,
        username: username,
      ),
    );
    if(result == "404"){
      Scaffold.of(context).showSnackBar(snack404);
    }
    if(result == "900"){
      Scaffold.of(context).showSnackBar(snack900);
    }
  }


   
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final String title = "Continue";
    final TextStyle titleStyle = new TextStyle(
        fontFamily: "HelveticaNeue",
        fontSize: 20,
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
              _navigateAndDisplaySelection(context);
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
}