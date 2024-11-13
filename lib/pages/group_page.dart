import 'package:flutter/material.dart';
import 'package:receipt_sharing/widgets/add_manually_modal.dart';
import 'package:receipt_sharing/widgets/rotating_dashed.dart';

class GroupPage extends StatefulWidget {
  final String groupName;

  final List<int> participants;

  // final double balance;

  const GroupPage({
    super.key,
    required this.groupName,
    required this.participants,
    // required this.balance,
  });

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.groupName),
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
                        widget.participants[index].toString(),
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ),
                  );
                },
              ),
            ),
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
                        '0.00'.toString(),
                        // '\$${widget.balance}',
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
            child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              FloatingActionButton(
                heroTag: 'home-button',
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.home),
              ),
              AddManuallyModal(),
              Expanded(child: Container()),
            ])));
  }
}
