import 'package:flutter/material.dart';

IconData iconFromCodepoint(int codePoint) {
  switch(codePoint) {
    case 0xe25b:
      return Icons.favorite;
    case 0xe06d:
      return Icons.airplane_ticket;
    case 0xe318:
      return Icons.home;
    case 0xe491:
      return Icons.person;
    case 0xe3c8:
      return Icons.map;
    case 0xe130:
      return Icons.camera_alt;
    case 0xf07d4:
      return Icons.wallet;
    case 0xe07e:
      return Icons.all_inclusive;
    case 0xe084:
      return Icons.anchor;
    case 0xe0a5:
      return Icons.assignment;
    case 0xe0b1:
      return Icons.attach_file;
    case 0xe0b2:
      return Icons.attach_money;
    case 0xe0b6:
      return Icons.audiotrack_sharp;
    case 0xe0b7:
      return Icons.auto_awesome;
    case 0xe0c9:
      return Icons.bakery_dining;
    case 0xe0d6:
      return Icons.beach_access;
    default:
      return Icons.help_outline;
  }
}
