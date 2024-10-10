import 'package:flutter/material.dart';

enum IconLabel {
  wallet('Wallet', Icon(Icons.wallet)),
  airplane('Airplane', Icon(Icons.airplane_ticket)),
  favorite('Heart', Icon(Icons.favorite));

  const IconLabel(this.label, this.icon);
  final String label;
  final Icon icon;
}

class IconDropdown extends StatefulWidget {
  final Function(Icon)? setIcon;
  const IconDropdown({super.key, this.setIcon});

  @override
  State<IconDropdown> createState() { return _IcondDropdownState(); }
}

class _IcondDropdownState extends State<IconDropdown> {
  final List<IconData> icons = [
    Icons.account_balance_wallet,
    Icons.airplane_ticket,
    Icons.favorite,
    Icons.home,
    Icons.person,
    Icons.map,
    Icons.camera_alt,
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
            children: List.generate(icons.length, (index) {
                return IconButton(
                  icon: Icon(icons[index]),
                  onPressed: () {
                    setState(() {
                      selectedIcon = icons[index];
                      widget.setIcon?.call(Icon(selectedIcon));
                    });
                    Navigator.pop(context);
                  },
                );
            }),
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            selectedIcon != null ? Icon(selectedIcon, size: 100) : Text('No icon selected'),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _openIconGrid, child: Text('Select an icon'),
            ),
          ],
        );
    // return DropdownMenu<IconLabel>(
    //   controller: iconController,
    //   enableFilter: true,
    //   requestFocusOnTap: true,
    //   label: const Text('Icon'),
    //   inputDecorationTheme: const InputDecorationTheme(
    //     filled: true,
    //     contentPadding: EdgeInsets.symmetric(vertical: 5.0),
    //   ),
    //   onSelected: (IconLabel? icon) {
    //     setState(() {
    //       selectedIcon = icon;
    //       widget.setIcon?.call(selectedIcon!.icon);
    //     });
    //   },
    //   dropdownMenuEntries: IconLabel.values.map<DropdownMenuEntry<IconLabel>>(
    //     (IconLabel icon) {
    //       return DropdownMenuEntry<IconLabel>(
    //         value: icon,
    //         label: icon.label,
    //         leadingIcon: icon.icon,
    //       );
    //     },
    //   ).toList(),
    // );
  // }
  }
}