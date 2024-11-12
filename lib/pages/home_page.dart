import 'package:flutter/material.dart';
import 'package:receipt_sharing/pages/adding_page.dart';
import 'package:receipt_sharing/pages/groups_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

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

  NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.onlyShowSelected;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40))
          ),
          child: NavigationBar(
            labelBehavior: labelBehavior,
            selectedIndex: currentPageIndex,
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            destinations: navBarList,
          ),
        ),
      ),
      body: <Widget>[
        const GroupsPage(),
        const AddingPage(),        

        /// Home page
        const Card(
          shadowColor: Colors.transparent,
          margin: EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'Profile Page (WIP)',
              ),
            ),
          ),
        ),
      ][currentPageIndex],
    );
  }
}
