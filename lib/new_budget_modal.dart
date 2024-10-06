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
            TextField(
              controller: participantController,
              decoration: const InputDecoration(hintText: 'Add a participant'),
            ),
          ],
        ),
      ),
    );
  }
}
