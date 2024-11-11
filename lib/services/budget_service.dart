import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:receipt_sharing/models/budget_model.dart';
class BudgetService {
  static const String _apiUrl = 'http://localhost:9000/api';
  static const user_id = 1;

  static final BudgetService _instance = BudgetService._internal();
  factory BudgetService() => _instance;
  BudgetService._internal();

  ValueNotifier<List<Budget>> budgets = ValueNotifier<List<Budget>>([]);

  Future<void> getBudgets() async {
    try {
      final response = await http.get(Uri.parse('$_apiUrl/get_groups/$user_id'));
      log(response.body.toString());

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        budgets.value = jsonResponse.map((data) => Budget.fromJson(data)).toList();
      } else {
        log("Error fetching budgets");
        // TODO implement better error handling here
      }
    } catch (e) {
      throw Exception('Failed to load budgets: $e');
    }
  }

  Future<void> addBudget(String name, List<String> participants, IconData icon) async {
    BudgetDTO payload = BudgetDTO(
      name: name,
      participants: participants,
      icon: icon.codePoint
    );

    try {
      final response = await http.post(
        Uri.parse('$_apiUrl/addBudget'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload.toJson()),
      );

      if (response.statusCode == 200) {
        Budget budget = Budget.fromJson(jsonDecode(response.body));
        budgets.value = [...budgets.value, budget];
      } else {
        log("Error adding to budgets");
      }
    } catch (e) {
      throw Exception('Failed to connect to budgets: $e');
    }
  }

  Future<void> quickAddExpense(int id, double amt) async {
    QuickAddDTO payload = QuickAddDTO(
      id: id,
      amt: amt,
    );

    try {
      final response = await http.post(
        Uri.parse('$_apiUrl/quickAddAmount'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload.toJson()),
      );

      if (response.statusCode == 200) {
        log("great success!");
      } else {
        log("Error quick adding to budgets");
      }
    } catch (e) {
        throw Exception('Failed to connect to budgets: $e');
    }
  }
}
