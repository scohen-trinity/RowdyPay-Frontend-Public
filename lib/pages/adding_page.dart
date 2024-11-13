import 'package:flutter/material.dart';
import 'package:receipt_sharing/pages/camera_page.dart';
import 'package:receipt_sharing/widgets/quick_add_modal.dart';

class AddingPage extends StatelessWidget {
  const AddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            QuickAddModal(),
            Card(
              child: ListTile(
                leading: const Icon(Icons.add_a_photo_rounded),
                title: const Text('Scan a receipt'),
                subtitle:
                    const Text('Quickly scan a receipt and add to a group'),
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return const CameraWidget();
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
