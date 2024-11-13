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
  NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.alwaysHide;
  
  final List<Widget> navBarList  = [
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
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
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
      body: <Widget>[
        const GroupsPage(),
        const AddingPage(),
        const ProfilePage(),
      ][currentPageIndex],
    );
  }
}
