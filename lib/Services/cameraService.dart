import 'package:camera/camera.dart';
import 'package:flutter/material.dart';


/// State of the Camera
class CameraService extends ChangeNotifier {

  CameraDescription firstCamera; /// Camera that we will be using on the [HomeScreen]

  CameraController _controller; /// Camera Controller


/// Getter of the camera
  CameraController getCamera(){ 
    return _controller;
  }
  
/// Setting up the camera controller 
  Future<void> setupCameras() async {
    try {
     final  cameras = await availableCameras();
      _controller = new  CameraController(cameras[0], ResolutionPreset.high);
      await _controller.initialize();
      print("Camera initialization is complete and the result is : "+_controller.value.isInitialized.toString());
    } on CameraException catch (_) {
      rethrow;
    }
  }


}