import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:camera/camera.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({super.key});

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  CameraController? _cameraController;
  bool _isCameraInitialized = false;

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      _cameraController = CameraController(
        cameras[0],
        ResolutionPreset.high,
      );
      await _cameraController!.initialize();
      setState(() {
        _isCameraInitialized = true;
      });
    }
  }

  Future<void> _requestPermissionAndOpenCamera() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      await _initializeCamera();
    } else {
      // Handle permission denial
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Camera permission denied')),
      // );
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _requestPermissionAndOpenCamera,
      child: Container(
        color: Colors.blue,
        child: Center(
          child: _isCameraInitialized && _cameraController != null
              ? CameraPreview(_cameraController!)
              : const Text("Tap to open camera"),
        ),
      ),
    );
  }
}
