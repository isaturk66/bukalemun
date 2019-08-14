import 'package:bukalemun/Services/cameraService.dart';
import 'package:camera/camera.dart';
import 'package:camera/new/src/common/camera_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Components/StoryCard.dart';
import 'dart:async';
import 'package:camera/camera.dart'as camera;



import '../Components/ArticleCard.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  Future<void> _initializeControllerFuture;
  bool isReady = false,isPositioned = false;
  TabController tabcontroller;
  CameraService service;
  
  


  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   

  }
  Widget cameraPreviewWidget(CameraController _controller ) {
    if (!_controller.value.isInitialized) {
      return  Center(child: CircularProgressIndicator());
    }
    return CameraPreview(_controller);
  }

  @override
  Widget build(BuildContext context) {
    service =  Provider.of<CameraService>(context);

    return Scaffold(
      backgroundColor: Colors.white,
     body:  cameraPreviewWidget(service.getCamera())
    );
  }
}

  
