import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:receipt_sharing/picture_page.dart';

class BudgetPage extends StatelessWidget {
  final String budgetName;

  final CameraDescription camera;

  const BudgetPage({ 
    super.key,
    required this.budgetName,
    required this.camera
  });

  // TODO Implement the logic to open the camera
  void addNewReceipt() {
    log('add new receipt');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO add participants at the top and a pay total in the middle
      body: Center(
        child: Column(children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Container(
              color: Theme.of(context).colorScheme.inversePrimary,
              child: Center(
                child: Text(
                  budgetName,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                )
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Container(
              color: Theme.of(context).primaryColorDark,
              child: const Text('This is where you will see participants'),
          ),),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Container(
              color: Theme.of(context).primaryColorLight,
              child: const Text('This is where you will see your balance'),
          ),),
        ])
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'home-button',
              onPressed: () { Navigator.pop(context); },
              child: const Icon(Icons.home),  
            ),
            Expanded(child: Container()),
            FloatingActionButton(
              heroTag: 'scan-button',
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return PicturePage(camera: camera);
                  }),
                );
              },
              child: const Icon(Icons.search),
            ),
          ]
        )
      )
    );
  }
}