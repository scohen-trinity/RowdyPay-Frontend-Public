import 'package:flutter/material.dart';

class IconDropdown extends StatefulWidget {
  @override
  _IcondDropdownState createState() => _IcondDropdownState();
}

class _IcondDropdownState extends State<IconDropdown> {
  List<IconData> icons = [Icons.account_balance_wallet, Icons.airplane_ticket, Icons.favorite];

  IconData? selectedIcon;
  
  @override
  Widget build(BuildContext context) {
    return DropdownButton<IconData>(
      value: selectedIcon,
      items: icons.map((IconData icon) {
        return DropdownMenuItem(
          value: icon,
          child: Icon(icon),
        );
      }).toList(),
      onChanged: (IconData? newIcon) {
        setState(() {
          selectedIcon = newIcon;
        });
      },
    );
  }
}
