import 'dart:developer';

import 'package:flutter/material.dart';

import 'new_budget_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of all budgets and the controller for the text field
  final List<String> budgets = ['Balcony Time', '219 Andrews', 'Crack Cardboard'];

  void budgetClicked() {
    log('budget clicked');
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
          itemBuilder: (context, index) {                      
            return ListTile(
              leading: const Icon(Icons.favorite),
              title: Text(budgets[index]),
              onTap: budgetClicked,
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
