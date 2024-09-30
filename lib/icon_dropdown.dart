import 'package:flutter/material.dart';

enum IconLabel {
  wallet('Wallet', Icons.wallet),
  airplane('Airplane', Icons.airplane_ticket),
  favorite('Heart', Icons.favorite);

  const IconLabel(this.label, this.icon);
  final String label;
  final IconData icon;
}

class IconDropdown extends StatefulWidget {
  const IconDropdown({super.key});

  @override
  _IcondDropdownState createState() => _IcondDropdownState();
}

class _IcondDropdownState extends State<IconDropdown> {
  List<IconData> icons = [Icons.account_balance_wallet, Icons.airplane_ticket, Icons.favorite];

  final TextEditingController iconController = TextEditingController();

  IconLabel? selectedIcon;
  
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<IconLabel>(
      controller: iconController,
      enableFilter: true,
      requestFocusOnTap: true,
      // leadingIcon: const Icon(Icons.search),
      label: const Text('Icon'),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
      ),
      onSelected: (IconLabel? icon) {
        setState(() {
          selectedIcon = icon;
        });
      },
      dropdownMenuEntries: IconLabel.values.map<DropdownMenuEntry<IconLabel>>(
        (IconLabel icon) {
          return DropdownMenuEntry<IconLabel>(
            value: icon,
            label: icon.label,
            leadingIcon: Icon(icon.icon),
          );
        },
      ).toList(),
    );
  }
}
