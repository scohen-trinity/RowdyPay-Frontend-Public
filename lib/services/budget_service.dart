import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:receipt_sharing/models/budget_model.dart';
class BudgetService {
  static const String _apiUrl = 'http://localhost:3000/api';

  Future<List<Budget>> getBudgets() async {
    try {
      final response = await http.get(Uri.parse('$_apiUrl/getBudgets'));
      List<Budget> budgets = [];

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        budgets = jsonResponse.map((data) => Budget.fromJson(data)).toList();
        log(jsonResponse.toString());
      } else {
        log("Error fetching budgets");
        // TODO implement better error handling here
      }
      return budgets;
    } catch (e) {
      throw Exception('Failed to load budgets: $e');
    }
  }

  Future<void> addBudget(Budget budget) async {
    try {
      final response = await http.post(
        Uri.parse('$_apiUrl/addBudget'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(budget.toJson()),
      );

      if (response.statusCode == 200) {
        log('Great success! ${response.body}');
      } else {
        log("Error adding to budgets");
      }
    } catch (e) {
      throw Exception('Failed to connect to budgets: $e');
    }
  }
}
