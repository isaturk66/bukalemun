import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Components/profileView.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

    return new Container(
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          new Container(
            height: 60,
            width: media.size.width,
            child: new CupertinoButton(
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              child: new Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: new IconTheme(
                      data: new IconThemeData(
                          color: Color.fromRGBO(17, 172, 83, 1), size: 26),
                      child: new Icon(Icons.search),
                    ),
                  ),
                  new Text(
                    "Find People",
                    style: new TextStyle(
                        color: Color.fromRGBO(17, 172, 83, 1), fontSize: 20),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final users = [
    "Ahmet Emre Gucer",
    "Mina Bengi Aral",
    "Batuhan Saridede",
    "Isa Turk",
    "Faruk Oztok",
    "Cenker Camci",
    "Doga Tekeli",
    "Idil Ece Alkan",
    "Erdem Tasbas",
    "Batuhan Sahin",
    "Dogu Cahit Alemdar",
    "Zeynep Sener",
    "Irem Isik",
    "Eran Kohen",
    "Duru Yilmaz",
    "Ummunaz Yanik",
    "Caglar Genc",
    "Alara Balcisoy",
    "Melike Koca",
    "Sila Sozeri",
    "Duru Bayramoglu",
    "Bora Balcay"
  ];

  final recentUsers = [
    "Ahmet Emre Gucer",
    "Mina Bengi Aral",
    "Batuhan Saridede",
    "Isa Turk",
    "Faruk Oztok",
    "Cenker Camci",
    "Doga Tekeli",
    "Idil Ece Alkan",
    "Erdem Tasbas",
    "Batuhan Sahin",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      new IconButton(
        icon: new Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return new IconButton(
      icon: new AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return ProfileView();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList = query.isEmpty
        ? recentUsers
        : users
            .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return new ListTile(
            onTap: () {
              showResults(context);
            },
            leading: Icon(Icons.person),
            title: new Text(suggestionList[index]));
      },
    );
  }
}
