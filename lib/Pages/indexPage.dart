import 'package:bukalemun/Components/CustomAppBar.dart';
import 'package:bukalemun/Components/CustomTabBar.dart';
import 'package:bukalemun/Pages/conferencesPage.dart';
import 'package:bukalemun/Pages/feedPage.dart';
import 'package:bukalemun/Pages/homePage.dart';
import 'package:bukalemun/Pages/profile.dart';
import 'package:bukalemun/Pages/searchPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


///Index Page is the index of app containing the constant widgets such as [CustomAppBar] and [CustomTabBar] which will prevent the re-rendering so the performance issues
class IndexPage extends StatefulWidget {
 
  
  IndexPage({Key key}) : super(key: key);

  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  TabController _controller;

  int currentPage = 0; /// Initial page of the [PageView]

  /// This variable is defined here to prevent stack collusions after calculation
  double tabBarHeight = 80; /// Height of the [CustomTabBar]
  double appBarHeight = 65; /// Height of the [CustomAppBar] minus top padding

  double appBarPlaceHolderHeight = 0;
  double tabBarPlaceHolderHeight = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    _controller = DefaultTabController.of(context);
    appBarPlaceHolderHeight = appBarHeight+MediaQuery.of(context).padding.top-5;
    tabBarPlaceHolderHeight = tabBarHeight-5;

 
    _controller.animation.addListener(() => updateState());

  }
  void updateState(){
    double difference = (_controller.animation.value-2.0).abs();

    if(difference <= 1.0){
      setState(() {});
    }


  }
  void calculateTabHeight(double index){
    final media = MediaQuery.of(context);
    final double yfinal = 0;
    final double yinitial = (tabBarHeight-15 );
    double y;
    double difference = (index-2.0).abs();

   
      if(difference <= 1.0){
        double process =(difference/1.0);
        y = process*yinitial;
          tabBarPlaceHolderHeight = y;
        
      }else tabBarPlaceHolderHeight = yinitial;
    
  
  }

   void calculateAppBarHeight(double index){
    final media = MediaQuery.of(context);
    final double yfinal = 0;
    final double yinitial = (media.padding.top+appBarHeight-15);
    double y;
    double difference = (index-2.0).abs();    
      if(difference <= 1.0){
        double process = (difference/1.0);
        y = process*yinitial;
          appBarPlaceHolderHeight = y;
      }else if(appBarPlaceHolderHeight != yinitial){
          appBarPlaceHolderHeight = yinitial;
      }
      
    
   }
  
  @override
  Widget build(BuildContext context) { 
        final media = MediaQuery.of(context);
      calculateAppBarHeight(_controller.animation.value);
      calculateTabHeight(_controller.animation.value);

    tabBarHeight = MediaQuery.of(context).size.height/10;
      return Container(
         child: Stack(
           children: <Widget>[

            Positioned(
              top: 0,
              child: CustomAppBar(height:65)
              ),/// AppBar With logo
            new Column(
              children: <Widget>[  
                new Container(height: appBarPlaceHolderHeight),
                PageFragment(), /// PageFragment containing the [PageView]            
                new Container(height: tabBarPlaceHolderHeight,width: media.size.width,color: Colors.white,)
              ],    
            ),
            Positioned(
              bottom: 0,
              child: CustomTabBar(tabBarHeight)
            ), /// Custom Painted Tabbar
          ],
        ),
     
    
      );
  }
}


class PageFragment extends StatelessWidget {
  TabController _controller; 
  
  var animationDuration = Duration(milliseconds: 300); /// On change do not forget to change the duration value on [TouchableElement]
  var animationCurve = Curves.easeIn;
  
  @override
  Widget build(BuildContext context) {
    
   return Expanded(
     child:  new TabBarView(
          children: <Widget>[
            FeedPage(),
            SearchPage(),
            HomePage(),
            ConferencesPages(),
            ProfilePage(),

          ],
        ),
     
   );
  }
}