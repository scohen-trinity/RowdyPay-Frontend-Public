import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
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
      home: const HomePage(title: 'Your Budgets'),
    );
  }
}
