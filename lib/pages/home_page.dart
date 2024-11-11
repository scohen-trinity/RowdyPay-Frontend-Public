import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:receipt_sharing/models/budget_model.dart';
import 'package:receipt_sharing/models/group_model.dart';
import 'package:receipt_sharing/pages/budget_page.dart';
import 'package:receipt_sharing/pages/new_budget_page.dart';
import 'package:receipt_sharing/services/budget_service.dart';
import 'package:receipt_sharing/services/group_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title, required this.camera});

  final String title;

  final CameraDescription camera;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GroupService _groupSvc = GroupService();

  @override
  void initState() {
    super.initState();
    _groupSvc.getGroups();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ValueListenableBuilder<List<Group>>(
            valueListenable: _groupSvc.groups,
            builder: (context, groupList, _) {
            return Center(
            child: ListView.builder(
              itemCount: groupList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  // leading: Icon(groupList[index].icon),
                  title: Text(groupList[index].gName),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return BudgetPage(budgetName: groupList[index].gName, participants: groupList[index].participants, camera: widget.camera);
                      }),
                    );
                  },
                  trailing: const Icon(Icons.more_vert),
                );
              }
            ),
          );
        }
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
            return const NewBudgetPage();
          }));
        },
        tooltip: 'Add a new shared budget',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
