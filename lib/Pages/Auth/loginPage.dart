
import 'package:bukalemun/Services/State/authState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bukalemun/Constants/routerConstants.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 static final _formKey = new GlobalKey<FormState>();
  
  final emailFieldController = TextEditingController();
  final passwordFieldController = TextEditingController();

  FocusNode emailfocus,passwordfocus;


  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    var authState  = Provider.of<AuthState>(context);

    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body:SingleChildScrollView(
        child:  new Column(
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
                                          controller: emailFieldController,
                                          focusNode: emailfocus,
                                            onFieldSubmitted: (term){
                                              print("submit");
                                              emailfocus.unfocus();
                                              FocusScope.of(context).requestFocus(passwordfocus);  
                                            },
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'This place cannot be empty';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            labelText:
                                                'Enter your e-mail',
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
                                        controller: passwordFieldController,
                                          focusNode: passwordfocus,
                                          onFieldSubmitted: (term){
                                              passwordfocus.unfocus();
                                            },
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
                              LoginButton(formKey : _formKey, emailFieldController: emailFieldController, passwordFieldController: passwordFieldController,)
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
      )
    );
  }
}


void submitForm(BuildContext context,var authState,GlobalKey<FormState> formKey,TextEditingController emailFieldController,TextEditingController passwordFieldController) async{

 var snack404 = SnackBar(content: Text('Bilinmeyen Bir Hata Oluştu. Yakında Tekrar Denersin Artık'));
  var snack900 = SnackBar(content: Text('Dostum Emailini Bulamadım. Kayıt Olmayı Unutmuş Olabilirsin'));
  var snack901 = SnackBar(content: Text('Şifre Yanlış Oldu. Lanet AutoComplete!!!'));

  if (formKey.currentState.validate()) {
            // If the form is valid, display a Snackbar.
       var response = await authState.initiateLogin(emailFieldController.text, passwordFieldController.text);
       if(response == 200){
         Navigator.of(context).pushNamed(PreIndex);
       }else if(response == 900){
         Scaffold.of(context).showSnackBar(snack900);
       }else if(response == 901){
         Scaffold.of(context).showSnackBar(snack901);
       }else{
        Scaffold.of(context).showSnackBar(snack404);
       }
          
      }
}

class LoginButton extends StatelessWidget {
   LoginButton({Key key,this.formKey,this.emailFieldController,this.passwordFieldController}) : super(key: key);
  final GlobalKey<FormState> formKey;
  final TextEditingController emailFieldController,passwordFieldController;
 
  final TextStyle titleStyle = new TextStyle(
        fontFamily: "HelveticaNeue",
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.w100);


  @override
  Widget build(BuildContext context) {
      var authState  = Provider.of<AuthState>(context);
      final media = MediaQuery.of(context);
      final String title = "Login";


    return Container(
    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
    child: SizedBox(
      width: media.size.width * (16 / 20),
      height: (media.size.width * (17 / 20)) / 7,
      child: MaterialButton(
        onPressed: () {
            submitForm(context, authState, formKey, emailFieldController, passwordFieldController);

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