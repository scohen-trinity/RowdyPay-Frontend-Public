import 'dart:developer';

import 'package:flutter/material.dart';

Future<String?> addNewBudgetDialog(BuildContext context) async {
  // const List<Icon> icons = [Icon(Icons.account_balance_wallet), Icon(Icons.airplane_ticket)];

  final TextEditingController budgetNameController = TextEditingController();

  // list of all budgets and the participants
  final TextEditingController budgetParticipants = TextEditingController();

  // make an api call to add a new budget w/ participants
  void addNewBudget() {
    log(budgetNameController.text + budgetParticipants.text);
  }

  return showDialog(
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
          // DropdownButton<IconData>(
          //   items: icons.map((icon) => DropdownMenuItem<IconData>(child: icon)).toList(), onChanged: (icon) => log(icon.toString()),),
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
