import 'package:flutter/material.dart';
import 'package:receipt_sharing/icon_dropdown.dart';

Future<void> addNewBudgetDialog(BuildContext context, Function(String, List<String>) onAddBudget) async {
  final TextEditingController budgetNameController = TextEditingController();

  // list of all budgets and the participants
  final TextEditingController budgetParticipants = TextEditingController();

  final List<String> participantsToAdd = [];

  // make an api call to add a new budget w/ participants
  void addNewBudget() {
    onAddBudget(budgetNameController.text, participantsToAdd);
  }

  return showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('New Budget Form'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // const Text('Enter a budget name: '),
          TextField(
            controller: budgetNameController,
            decoration: const InputDecoration(hintText: 'Budget Name'),
          ),
          // const Text('Enter budget participants: '),
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
