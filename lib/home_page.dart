// import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:receipt_sharing/budget_page.dart';

import 'new_budget_dialog.dart';

class Budget {
  final int id;
  final String name;
  final List<String> participants;

  Budget({required this.id, required this.name, required this.participants});

  // TODO check the factory annotation here for JSON parsing
  factory Budget.fromJson(Map<String, dynamic> json) {
    return Budget(
      id: json['id'],
      name: json['name'],
      participants: json['participants'],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title, required this.camera});

  final String title;

  final CameraDescription camera;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of all budgets and the controller for the text field
  final List<Budget> budgets = [
    Budget(id: 1, name: 'Balcony Time', participants: ['Sam', 'Aiden', 'Sandra', 'Kyle']),
    Budget(id: 2, name: '219 Andrews', participants: ['Sam', 'Jax', 'Nate', 'Levi']),
    Budget(id: 3, name: 'Crack Cardboard', participants: ['Sam', 'Nate', 'Kyle', 'Sandra']),
  ];

  // TODO Implement fetch call to get real budgets
  void fetchBudgets() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: budgets.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: const Icon(Icons.favorite),
              title: Text(budgets[index].name),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return BudgetPage(budgetName: budgets[index].name, participants: budgets[index].participants, camera: widget.camera);
                  }),
                );
              },
              trailing: const Icon(Icons.more_vert),
            );
          }
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewBudgetDialog(context);
        },
        tooltip: 'Add a new shared budget',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
