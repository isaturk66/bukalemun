import 'package:bukalemun/Model/UserModel.dart';
import 'package:bukalemun/Model/args/schoolNavigatonObject.dart';
import 'package:bukalemun/Model/schoolsModel.dart';
import 'package:bukalemun/Services/State/authState.dart';
import 'package:bukalemun/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:bukalemun/Constants/routerConstants.dart';
import 'package:bukalemun/Services/schools.dart';
import 'package:provider/provider.dart';



class SchoolPage extends StatefulWidget {
 final SchoolNavigationObject passeddata;

  SchoolPage(this.passeddata);

  @override
  _SchoolPageState createState() => _SchoolPageState();
}

class _SchoolPageState extends State<SchoolPage> {
  List<SchoolModel> pageData;
  
  getInstance() async{
   List<SchoolModel> response = await Schools.getSchools();
    setState(() {
     pageData = response;
     print(pageData[0].name);
    });
  }

  fetchData(SchoolModel selected)async{

    var response = await Auth.register(
      username: widget.passeddata.username,
      password: widget.passeddata.password,
      email:  widget.passeddata.email,
      fullname: widget.passeddata.nameSurname,
      school: selected.name,
    );
    return response;
  }
  postRegister(SchoolModel selected,BuildContext context)async{
    var authState = Provider.of<AuthState>(context);
    var response = await fetchData(selected);

    if(response.statusCode == 200){
      //Success!!
     var subresponse = await authState.initiateLogin(widget.passeddata.email,widget.passeddata.password);
     if(subresponse == 200){
       Navigator.of(context).pushNamed(PreIndex);
     }else {
       Navigator.pop(context,"404");
     }
    }else if(response.body == "900"){
      Navigator.pop(context,"900");
    }else {
      Navigator.pop(context,"404");
    }
  }

  @override
  void initState() { 
    super.initState();
    getInstance();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final schools = ["The Koc School", "Robert College", "St Joseph Highschool", "Galatasary Highschool", "Hisar Schools", "Sisli Terakki High School", "Uskudar American Academy", "American College Izmir", "SEV American College", "Inanc Highschool", "Bilkent Laboratory and International School (BLIS)", "METU College", "Istanbul International High School", "ENKA Schools", "Kadikoy Anatolian High School", "German High School", "SAJEV", "Saint Benoit French High School"];
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: media.size.width * 0.55,
            child: Image.asset("assets/assets/bukalemunlogo.png"),
            margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
              width: media.size.width,
              child: new Text(
                "Pick Your School",
                style: new TextStyle(
                    color: Color.fromRGBO(17, 172, 83, 1), fontSize: 28),
              )),

              pageData != null ? Flexible(
                child: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 3,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(pageData.length, (index) {
            return Center(
                child: MaterialButton(
                  onPressed: () {
                    postRegister(pageData[index], context);  

                  },
                    child: Image.network(pageData[index].iconUrl),
                )
            );
          }),
        ),
        )
        :
        new Container(),
        ],
      ),
    );
  }
}


