import 'package:flutter/material.dart';
import 'package:receipt_sharing/models/budget_model.dart';
import 'package:receipt_sharing/services/budget_service.dart';
import 'package:receipt_sharing/widgets/icon_dropdown.dart';

class NewBudgetPage extends StatefulWidget {
  final Function(String, List<String>, Icon) addNewBudget;

  const NewBudgetPage({super.key, required this.addNewBudget});

  @override
  State<NewBudgetPage> createState() => _NewBudgetPageState();
}

class _NewBudgetPageState extends State<NewBudgetPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController participantController = TextEditingController();
  final List<String> participantsToAdd = [];
  IconData currentIcon = Icons.favorite;

  void addNewBudget(String name, List<String> participants, IconData icon) {
    Budget newBudget = Budget(
      id: 10,
      name: name,
      participants: participants,
      balance: 0,
      icon: icon,
    );
    BudgetService().addBudget(newBudget);
  }

  void setCurrentIcon(IconData icon) {
    currentIcon = icon;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Budget Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      width: 1.0,
                    ),
                  ),
                  ),
              ),
              Row(
                children: [
                  Expanded(child: TextField(
                    controller: participantController,
                    decoration: InputDecoration(
                      hintText: 'Add a participant',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),),
                  SizedBox(
                    width: 50,
                    height: 30,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero
                      ),
                      onPressed: () {
                        participantsToAdd.add(participantController.text);
                        participantController.text = "";
                      },
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              IconDropdown(setIcon: setCurrentIcon),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () { 
                      addNewBudget(nameController.text, participantsToAdd, currentIcon);
                      Navigator.pop(context);
                    },
                    child: const Text('CREATE'),
                  ),
                  ElevatedButton(
                    onPressed: () { Navigator.pop(context); },
                    child: const Text('CANCEL')
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
