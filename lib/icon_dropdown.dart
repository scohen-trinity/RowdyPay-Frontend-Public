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
      label: const Text('Icon'),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
      ),
      onSelected: (IconLabel? icon) {
        setState(() {
          selectedIcon = icon;
          widget.setIcon?.call(selectedIcon!.icon);
        });
      },
      dropdownMenuEntries: IconLabel.values.map<DropdownMenuEntry<IconLabel>>(
        (IconLabel icon) {
          return DropdownMenuEntry<IconLabel>(
            value: icon,
            label: icon.label,
            leadingIcon: icon.icon,
          );
        },
      ).toList(),
    );
  }
}