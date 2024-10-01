import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:receipt_sharing/icon_dropdown.dart';

Future<void> addNewBudgetDialog(BuildContext context, Function(String, String) onAddBudget) async {
  final TextEditingController budgetNameController = TextEditingController();

  // list of all budgets and the participants
  final TextEditingController budgetParticipants = TextEditingController();

  // make an api call to add a new budget w/ participants
  void addNewBudget() {
    onAddBudget(budgetNameController.text, budgetParticipants.text);
    log(budgetNameController.text + budgetParticipants.text);
  }

  return showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('New Budget Form'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Enter a budget name: '),
          TextField(
            controller: budgetNameController,
            decoration: const InputDecoration(hintText: 'Budget Name'),
          ),
          const Text('Enter budget participants: '),
          TextField(
            controller: budgetParticipants,
            decoration: const InputDecoration(hintText: 'Budget Name'),
          ),
          const Text('Choose an Icon'),
          const IconDropdown(),
        ],
      ),
      actions: [
        TextButton(onPressed: () {
          addNewBudget();
          Navigator.pop(context);
        }, child: const Text('CREATE')),
        TextButton(onPressed: () {
          Navigator.pop(context);
        }, child: const Text('CANCEL'))
      ],
    ));
}
