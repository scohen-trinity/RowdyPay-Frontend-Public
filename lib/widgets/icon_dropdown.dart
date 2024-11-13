import 'package:flutter/material.dart';

class IconDropdown extends StatefulWidget {
  final Function(IconData)? setIcon;
  const IconDropdown({super.key, this.setIcon});

  @override
  State<IconDropdown> createState() {
    return _IcondDropdownState();
  }
}

class _IcondDropdownState extends State<IconDropdown> {
  final List<IconData> icons = [
    Icons.wallet,
    Icons.airplane_ticket,
    Icons.favorite,
    Icons.home,
    Icons.person,
    Icons.map,
    Icons.camera_alt,
    Icons.all_inclusive,
    Icons.anchor,
    Icons.assignment,
    Icons.attach_file,
    Icons.attach_money,
    Icons.audiotrack_sharp,
    Icons.auto_awesome,
    Icons.bakery_dining,
    Icons.beach_access,
  ];

  final TextEditingController iconController = TextEditingController();

  IconData? selectedIcon;

  void _openIconGrid() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(10),
          height: 250,
          child: GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            children: List.generate(
              icons.length,
              (index) {
                return IconButton(
                  icon: Icon(icons[index]),
                  onPressed: () {
                    setState(() {
                      selectedIcon = icons[index];
                      widget.setIcon?.call(selectedIcon!);
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        selectedIcon != null
            ? Icon(selectedIcon, size: 100)
            : const Text('No icon selected'),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _openIconGrid,
          child: const Text('Select an icon'),
        ),
      ],
    );
  }
}
