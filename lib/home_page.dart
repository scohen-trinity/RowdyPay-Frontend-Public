// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:receipt_sharing/budget_page.dart';

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

  // TODO Implement fetch call to get real budgets

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
              title: Text(budgets[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return BudgetPage(budgetName: budgets[index]);
                  })
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
