import 'package:flutter/material.dart';
import 'package:receipt_sharing/icon_dropdown.dart';

class NewBudgetModal extends StatefulWidget {
  final Function(String, List<String>, Icon) addNewBudget;

  const NewBudgetModal({super.key, required this.addNewBudget});

  @override
  State<NewBudgetModal> createState() => _NewBudgetModalState();
}

class _NewBudgetModalState extends State<NewBudgetModal> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController participantController = TextEditingController();
  final List<String> participantsToAdd = [];
  Icon currentIcon = const Icon(Icons.favorite);

  void addNewBudget(String name, List<String> participants, Icon icon) {
    widget.addNewBudget(name, participants, icon);
  }

  void setCurrentIcon(Icon icon) {
    currentIcon = icon;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: 'Budget Name'),
            ),
            Row(
              children: [
                Expanded(child: TextField(
                  controller: participantController,
                  decoration: const InputDecoration(hintText: 'Add a participant'),
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
                  onPressed: () { addNewBudget(nameController.text, participantsToAdd, currentIcon); },
                  child: const Text('CREATE'),
                ),
                ElevatedButton(
                  onPressed: () {Navigator.pop(context); },
                  child: const Text('CANCEL')
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
