import 'package:bukalemun/Services/State/cameraService.dart';
import 'package:camera/camera.dart';
import 'package:camera/new/src/common/camera_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Components/StoryCard.dart';
import 'dart:async';
import 'package:camera/camera.dart' as camera;

import '../Components/ArticleCard.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _initializeControllerFuture;
  bool isReady = false, isPositioned = false;
  TabController tabcontroller;
  CameraService service;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget cameraPreviewWidget(CameraController _controller) {
    if (!_controller.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }
    return CameraPreview(_controller);
  }

  @override
  Widget build(BuildContext context) {
    service = Provider.of<CameraService>(context);
    final media = MediaQuery.of(context);

    return Scaffold(
        backgroundColor: Colors.white,
        body: new Stack(
          children: <Widget>[
            cameraPreviewWidget(service.getCamera()),
            Positioned(
              bottom: 30,
              left: (media.size.width - (media.size.width/4))/2,
              child: InkWell(
                onTap: (){print("tapped");},
                              child: Container(
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(media.size.width/4),
                    border: new Border.all(color: Colors.white, width: 7)
                  ),
                  width: media.size.width/4,
                  height: media.size.width/4,
                ),
              ),
            )
          ],
        ));
  }
}
