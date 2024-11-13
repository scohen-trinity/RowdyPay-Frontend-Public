import 'package:flutter/material.dart';
import 'package:receipt_sharing/pages/adding_page.dart';
import 'package:receipt_sharing/pages/groups_page.dart';
import 'package:receipt_sharing/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysHide;

  final List<Widget> navBarList = [
    const NavigationDestination(
      selectedIcon: Icon(Icons.auto_awesome_motion_rounded),
      icon: Icon(Icons.auto_awesome_motion_outlined),
      label: 'Groups',
    ),
    const NavigationDestination(
      selectedIcon: Icon(Icons.add_circle_rounded),
      icon: Icon(Icons.add_circle_outline_rounded),
      label: 'Add',
    ),
    const NavigationDestination(
      selectedIcon: Icon(Icons.account_circle_rounded),
      icon: Icon(Icons.account_circle_outlined),
      label: 'Profile',
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(12.0),
            width: MediaQuery.of(context).size.width * 0.8,
            height: 55,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: NavigationBar(
              labelBehavior: labelBehavior,
              backgroundColor: Colors.transparent,
              onDestinationSelected: (int index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              height: 100,
              selectedIndex: currentPageIndex,
              destinations: const <Widget>[
                NavigationDestination(
                  selectedIcon: Icon(Icons.auto_awesome_motion_rounded),
                  icon: Icon(Icons.auto_awesome_motion_outlined),
                  label: 'Groups',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.add_circle_rounded),
                  icon: Icon(Icons.add_circle_outline_rounded),
                  label: 'Add',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.account_circle_rounded),
                  icon: Icon(Icons.account_circle_outlined),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
      body: <Widget>[
        const GroupsPage(),
        const AddingPage(),
        const ProfilePage(),
      ][currentPageIndex],
    );
  }
}
