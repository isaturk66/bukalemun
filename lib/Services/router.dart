import 'package:bukalemun/Constants/routerConstants.dart';
import 'package:bukalemun/Pages/Auth/hybridAuth.dart' as prefix2;
import 'package:bukalemun/Pages/Auth/loginPage.dart' as prefix3;
import 'package:bukalemun/Pages/Auth/signUpPage.dart' as prefix4;
import 'package:bukalemun/Pages/Auth/schoolPage.dart' as prefix5;
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
      case LoginPage : {
        return MaterialPageRoute(builder: (context) => prefix3.LoginPage());
    }
      break;

      case SignUpPage : {
        return MaterialPageRoute(builder: (context) => prefix4.SignUpPage());
    }
      break;
    
  }

}
