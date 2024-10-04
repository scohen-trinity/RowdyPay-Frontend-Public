import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:receipt_sharing/icon_dropdown.dart';

Future<void> addNewBudgetDialog(BuildContext context, Function(String, List<String>, Icon) onAddBudget) async {
  final TextEditingController budgetNameController = TextEditingController();

  // list of all budgets and the participants
  final TextEditingController budgetParticipants = TextEditingController();

  final List<String> participantsToAdd = [];
  
  Icon currentIcon = const Icon(Icons.favorite);

  // make an api call to add a new budget w/ participants
  void addNewBudget() {
    log(currentIcon.toString());
    onAddBudget(budgetNameController.text, participantsToAdd, currentIcon);
  }

  void setIcon(Icon icon) {
    currentIcon = icon;
  }

  return showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('New Budget Form'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: budgetNameController,
            decoration: const InputDecoration(hintText: 'Budget Name'),
          ),
          Row(
            children: [
              Expanded(child: 
                TextField(
                  controller: budgetParticipants,
                  decoration: const InputDecoration(hintText: 'Add a participant'),
                ),
              ),
              SizedBox(
                width: 50,
                height: 30,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: const Icon(Icons.add),
                  onPressed: () {
                    participantsToAdd.add(budgetParticipants.text);
                    budgetParticipants.text = "";
                  }
                ),
              ),
            ],
          ),
          const Text('Choose an Icon'),
          IconDropdown(setIcon: setIcon),
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
