import 'package:bukalemun/Model/UserModel.dart';
import 'package:bukalemun/Services/State/authState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Components/ProfileStack.dart';
import '../Components/ConferenceCard.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User currentUser;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    var authState  = Provider.of<AuthState>(context);
    currentUser = authState.currentUser;
  }


  @override
  Widget build(BuildContext context) {
    final strings = ["one","two","three","one","two","three","one","two","three"];

    


    return new Scaffold(
      backgroundColor: Color.fromRGBO(17, 172, 83, 1),
      body: new SingleChildScrollView(
              child: new Container(
          color: Colors.white,
          child: new Column(
            children: <Widget>[
              //The stack widget that goes until the bottom of the profile image
              new ProfileStack(
                image: new Image.network(
                    "https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg"),
                nameSurname: currentUser.fullname,
                school: currentUser.school,
                experiencesNum: currentUser.experiences.length.toString(),
                friendsNum: currentUser.friends.length.toString(),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: new Text(
                    "@"+currentUser.username,
                    style: new TextStyle(
                        color: Color.fromRGBO(17, 172, 83, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w100),
                  )),
                  new Column(children: strings.map((item) => new ConferenceCard()).toList())
            ],
          ),
        ),
      ),
    );
  }
}
