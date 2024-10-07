import 'dart:developer';

import 'package:flutter/material.dart';

class NewBudgetModal extends StatefulWidget {
  const NewBudgetModal({super.key});

  void addNewBudget() {
    log('triggered');
  }

  @override
  State<NewBudgetModal> createState() => _NewBudgetModalState();
}

class _NewBudgetModalState extends State<NewBudgetModal> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController participantController = TextEditingController();
  final List<String> participantsToAdd = [];


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
                    child: const Icon(Icons.add)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
