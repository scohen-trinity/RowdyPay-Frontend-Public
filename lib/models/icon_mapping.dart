import 'package:flutter/material.dart';

IconData iconFromString(String name) {
  switch(name) {
    case 'favorite':
      return (Icons.favorite);
    case 'airplane_ticket':
      return Icons.airplane_ticket;
    case 'home':
      return Icons.home;
    case 'person':
      return Icons.person;
    case 'map':
      return Icons.map;
    case 'camera_alt':
      return Icons.camera_alt;
    case 'wallet':
      return Icons.wallet;
    case 'all_inclusive':
      return Icons.all_inclusive;
    default:
      return Icons.help_outline;
  }
}
