import 'package:flutter/material.dart';
import 'package:receipt_sharing/models/group_model.dart';
import 'package:receipt_sharing/pages/group_page.dart';
import 'package:receipt_sharing/services/group_service.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  State<StatefulWidget> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  final GroupService _groupSvc = GroupService();

  @override
  void initState() {
    super.initState();
    _groupSvc.getGroups();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<Group>>(
      valueListenable: _groupSvc.groups,
      builder: (context, groupList, _) {
        return Center(
          child: ListView.builder(
            itemCount: groupList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.bluetooth),
                  title: Text(groupList[index].gName),
                  subtitle: const Text('Amount owed: '),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return GroupPage(
                            groupName: groupList[index].gName,
                            participants: groupList[index].participants);
                      }),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
