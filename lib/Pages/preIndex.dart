import 'package:bukalemun/Pages/indexPage.dart';
import 'package:bukalemun/Pages/splashScreen.dart';
import 'package:bukalemun/Services/State/cameraService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PreIndex extends StatelessWidget {
  


  CameraService service;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 2,
      child: IndexPage(),
    );
  }
}