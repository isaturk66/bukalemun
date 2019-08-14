import 'package:bukalemun/Constants/routerConstants.dart';
import 'package:flutter/material.dart';

import 'package:bukalemun/Services/router.dart' as router;
import 'package:provider/provider.dart';

import 'Services/cameraService.dart';

void main(){ 
  Provider.debugCheckInvalidValueType = null;
  CameraService service = new CameraService();
  service.setupCameras();
  print("runApp is working now");
  runApp(
    Provider<CameraService>.value( ///Camera State
      value: service,
      child: Main()
    )
  );
}

  /// If you are working on a single page you cant just remove the [initialRoute: HomePage] and use the home property
  /// For Example I want to work on home page without building the other pages:
  /// Then I shall import the page ex: [import 'package:bukalemun/Pages/homePage.dart';]
  /// Then add the home property inside [MaterialApp] Widget ex [home: HomePage(),]

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: router.generateRoute,
      initialRoute: Splash,
    );
  }
}