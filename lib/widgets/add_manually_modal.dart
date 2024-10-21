import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddManuallyModal extends StatelessWidget {
  AddManuallyModal({super.key});
  final TextEditingController dollarController = TextEditingController();
  final TextEditingController centsController = TextEditingController();
  static const double controllerSize = 48;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(context: context, builder: (BuildContext context) {
          return SizedBox(
            height: 200,
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: dollarController,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: controllerSize,
                      ),
                      decoration: const InputDecoration(
                        hintText: '0',
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.number,
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
            ),
          );
        });
      },
      tooltip: "Quick add an expense.",
      child: const Icon(Icons.add),
    );
  }
}