import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:receipt_sharing/models/budget_model.dart';
import 'package:receipt_sharing/pages/budget_page.dart';
import 'package:receipt_sharing/pages/new_budget_page.dart';
import 'package:receipt_sharing/services/budget_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title, required this.camera});

  final String title;

  final CameraDescription camera;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BudgetService _budgetSvc = BudgetService();

  @override
  void initState() {
    super.initState();
    _budgetSvc.getBudgets();
  }

  // make an api call to add a new budget w/ participants
  void addNewBudget(String name, List<String> participants, Icon icon) {
    setState(() {
      // budgets.add(Budget(id: budgets.length, name: name, participants: participants, balance: 0, icon: icon));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ValueListenableBuilder<List<Budget>>(
            valueListenable: _budgetSvc.budgets,
            builder: (context, budgetList, _) {
            log("Triggered");
            return Center(
            child: ListView.builder(
              itemCount: budgetList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(budgetList[index].icon),
                  title: Text(budgetList[index].name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return BudgetPage(budgetName: budgetList[index].name, participants: budgetList[index].participants, camera: widget.camera, balance: budgetList[index].balance);
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
            return NewBudgetPage(addNewBudget: addNewBudget);
          }));
        },
        tooltip: 'Add a new shared budget',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
