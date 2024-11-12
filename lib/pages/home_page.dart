import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:receipt_sharing/pages/groups_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title, required this.camera});

  final String title;

  final CameraDescription camera;

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
        /// Notifications page
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 1'),
                  subtitle: Text('This is a notification'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 2'),
                  subtitle: Text('This is a notification'),
                ),
              ),
            ],
          ),
        ),

        /// Home page
        const Card(
          shadowColor: Colors.transparent,
          margin: EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'Home page',
              ),
            ),
          ),
        ),
      ][currentPageIndex],
    );
  }
}
