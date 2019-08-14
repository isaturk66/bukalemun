import 'package:bukalemun/Constants/routerConstants.dart';
import 'package:bukalemun/Pages/Auth/hybridAuth.dart' as prefix2;
import 'package:bukalemun/Pages/preIndex.dart' as prefix1;
import 'package:bukalemun/Pages/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:bukalemun/Pages/indexPage.dart' as prefix0;


Route<dynamic> generateRoute(RouteSettings settings) {
  // Here is where all the routing is handled

  switch(settings.name){
    case IndexPage : {
        return MaterialPageRoute(builder: (context) => prefix0.IndexPage());
      }
      break;
    case PreIndex : {
        return MaterialPageRoute(builder: (context) => prefix1.PreIndex());
      }
      break;
    case Splash : {
        return MaterialPageRoute(builder: (context) => SplashScreen());
    }
      break;
    case HybridAuth : {
        return MaterialPageRoute(builder: (context) => prefix2.HybridAuth());
    }
      break;
    
  }

}
