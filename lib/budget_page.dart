import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:receipt_sharing/picture_page.dart';

class BudgetPage extends StatefulWidget {
  final String budgetName;

  final CameraDescription camera;
  
  const BudgetPage({ 
    super.key,
    required this.budgetName,
    required this.camera,
  });

  @override
  State<BudgetPage> createState() => _BudgetPageState();

}

class _BudgetPageState extends State<BudgetPage> {
  final List<String> participants = ['Aiden', 'Kyle', 'Sam', 'Sandra'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.budgetName),
      ),
      // TODO add participants at the top and a pay total in the middle
      body: Center(
        child: Column(children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: participants.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue[200],
                    ),
                    child: Center(
                      child: Text(
                        participants[index].substring(0, 1),
                        style: const TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ),
                  ),
                );
              },
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
                    return PicturePage(camera: widget.camera);
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
