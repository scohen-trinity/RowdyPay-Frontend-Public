import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';

import 'home_page.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO Need to add in error handling for when a user does not want to add a camera
  final cameras = await availableCameras();

  final firstCamera = cameras.first;

  runApp(App(camera: firstCamera));
}

class App extends StatefulWidget {
  const App({super.key, required this.camera});

  final CameraDescription camera;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    requestStoragePermission();
  }

  void requestStoragePermission() async {
    // Check if the platform is not web, as web has no permissions
    // if (!kIsWeb) {
    //   // Request storage permission
    //   var status = await Permission.storage.status;
    //   if (!status.isGranted) {
    //     await Permission.storage.request();
    //   }

    //   // Request camera permission
    //   var cameraStatus = await Permission.camera.status;
    //   if (!cameraStatus.isGranted) {
    //     await Permission.camera.request();
    //   }
    // }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Sharing App',
      // Light mode
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Dark mode
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: const Color(0xff4C3F39),
      ),
      themeMode: ThemeMode.dark,
      home: HomePage(title: 'Your Budgets', camera: widget.camera),
    );
  }
}
