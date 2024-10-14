import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:receipt_sharing/pages/picture_page.dart';
import 'package:receipt_sharing/widgets/rotating_dashed.dart';

class BudgetPage extends StatefulWidget {
  final String budgetName;

  final List<String> participants;

  final CameraDescription camera;

  final double balance;
  
  const BudgetPage({ 
    super.key,
    required this.budgetName,
    required this.participants,
    required this.balance,
    required this.camera,
  });

  @override
  State<BudgetPage> createState() => _BudgetPageState();

}

class _BudgetPageState extends State<BudgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.budgetName),
      ),
      body: Center(
        child: Column(children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.participants.length,
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
                        widget.participants[index].substring(0, 1),
                        style: const TextStyle(
                          color: Colors.blue,
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
            child: Center(
              child: RotatingDashedCircle(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '\$${widget.balance}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
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
