import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:receipt_sharing/models/budget_model.dart';
class BudgetService {
  static const String _apiUrl = 'http://localhost:3000/api';
  
  static final BudgetService _instance = BudgetService._internal();
  factory BudgetService() => _instance;
  BudgetService._internal();

  ValueNotifier<List<Budget>> budgets = ValueNotifier<List<Budget>>([]);

  

  Future<void> getBudgets() async {
    try {
      final response = await http.get(Uri.parse('$_apiUrl/getBudgets'));

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
        // Budget budget = Budget(id: 10, name: "Test", participants: [], balance: 0, icon: Icons.favorite);
        budgets.value = [...budgets.value, budget];
        log('Append this budget: ${budget.name}, Current length: ${budgets.value.length}');

        // log(response.body);
      } else {
        log("Error adding to budgets");
      }
    } catch (e) {
      throw Exception('Failed to connect to budgets: $e');
    }
  }
}
