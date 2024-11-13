import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:receipt_sharing/services/budget_service.dart';

class AddManuallyModal extends StatelessWidget {
  AddManuallyModal({super.key});
  final TextEditingController dollarController =
      TextEditingController(text: "00");
  final TextEditingController centsController =
      TextEditingController(text: "00");
  static const double controllerSize = 48;

  void addToBudget([int dollars = 0, int cents = 0]) {
    double amt = dollars + (cents / 100);
    BudgetService().quickAddExpense(1, amt);
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 200,
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: dollarController,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: controllerSize,
                              ),
                              decoration: const InputDecoration(
                                hintText: '00',
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          const Text(
                            ".",
                            style: TextStyle(
                              fontSize: controllerSize,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: centsController,
                              style: const TextStyle(
                                fontSize: controllerSize,
                              ),
                              decoration: const InputDecoration(
                                hintText: '00',
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(2),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          addToBudget(int.parse(dollarController.text),
                              int.parse(centsController.text));
                          Navigator.pop(context);
                        },
                        child: const Text('submit'),
                      ),
                    ],
                  ),
                ),
              );
            });
      },
      tooltip: "Quick add an expense.",
      child: const Icon(Icons.add),
    );
  }
}
