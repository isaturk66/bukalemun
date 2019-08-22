import 'package:flutter/material.dart';
import 'package:bukalemun/Constants/routerConstants.dart';

class SchoolPage extends StatelessWidget {
  final String nameSurname;
  final String username;
  final String password;
  final String email;

  SchoolPage(this.email, this.nameSurname, this.password, this.username);

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
              Container(
                height: media.size.height - 200,
                child: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 3,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(19, (index) {
            final i = index + 1;
            return Center(
                child: MaterialButton(
                  onPressed: () {Navigator.pushNamed(context, PreIndex);},
                    child: Image.asset("assets/assets/school$i.png"),
                )
            );
          }),
        ),
              ),
        ],
      ),
    );
  }
}
