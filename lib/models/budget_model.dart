import 'package:flutter/material.dart';
import 'package:receipt_sharing/models/icon_mapping.dart';

class Budget {
  final int id;
  final String name;
  final List<String> participants;
  final double balance;
  final IconData icon;

  Budget({
    required this.id,
    required this.name,
    required this.participants,
    required this.balance,
    required this.icon,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'participants': participants,
      'balance': balance,
      'icon': icon.toString(),
    };
  }

  factory Budget.fromJson(Map<String, dynamic> json) {
    return Budget(
      id: json['id'],
      name: json['name'],
      participants: List<String>.from(json['participants']),
      balance: json['balance'],
      icon: iconFromString(json['icon']),
    );
  }
}