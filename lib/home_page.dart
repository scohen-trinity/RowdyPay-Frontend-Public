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

  // TODO Implement fetch call to get real budgets
  
  // TODO Implement the logic to open the camera (this function probably won't be where it is now)
  void addNewReceipt() {
    log('add new receipt');
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
              title: Text(budgets[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return Scaffold(
                      // TODO add participants at the top and a pay total in the middle
                      body: Center(
                        child: ActionChip(label: const Icon(Icons.home), onPressed: () { Navigator.pop(context); })
                      ),
                      floatingActionButton: FloatingActionButton(
                        onPressed: addNewReceipt,
                        child: const Icon(Icons.search),
                      )
                    );
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
