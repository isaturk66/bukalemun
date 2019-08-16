import 'package:bukalemun/Constants/routerConstants.dart';
import 'package:bukalemun/Services/cameraService.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

   static const Color splashColor = Color.fromRGBO(17, 172, 83, 1);
  final FlareControls controls = FlareControls();
   FlareController controller;
   CameraService service;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controls.isActive.addListener(animationCallBack);
    pushRoute();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future pushRoute(){
    return Future.delayed(const Duration(seconds: 5), () => Navigator.pushNamed(context, HybridAuth));

  }

  void animationCallBack(){
    bool condition = controls.isActive.value;
    if(!condition){
      controls.play("swing");
    }
  }
  
 @override
  Widget build(BuildContext context) {
    return Container(
      color: splashColor,
      child: new Center(
        child: new FlareActor("assets/flare/splashAnimation.flr", alignment:Alignment.center, fit:BoxFit.contain, animation:"swing",controller: controls,)
      ),
    );
  }
}
