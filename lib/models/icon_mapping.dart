import 'package:flutter/material.dart';

IconData iconFromString(String name) {
  switch(name) {
    case 'favorite':
      return Icons.favorite;
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
    case 'anchor':
      return Icons.anchor;
    case 'assignment':
      return Icons.assignment;
    case 'attach_file':
      return Icons.attach_file;
    case 'attach_money':
      return Icons.attach_money;
    case 'audiotrack':
      return Icons.audiotrack_sharp;
    case 'auto_awesome':
      return Icons.auto_awesome;
    case 'bakery':
      return Icons.bakery_dining;
    case 'beach':
      return Icons.beach_access;
    default:
      return Icons.help_outline;
  }
}
