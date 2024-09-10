import 'package:flutter/material.dart';

import 'home_page.dart';
void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

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
        colorSchemeSeed: const Color.fromRGBO(86, 80, 14, 171),
      ),
      themeMode: ThemeMode.dark,
      home: const HomePage(title: 'Your Budgets'),
    );
  }
}
