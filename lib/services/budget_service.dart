import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
class BudgetService {
  static const String _apiUrl = 'http://localhost:3000';

  Future<void> getBudget() async {

    try {
      final response = await http.get(Uri.parse('$_apiUrl/getBudgets'));

      if (response.statusCode == 200) {
        // do some stuff
        List<dynamic> budgets = jsonDecode(response.body);
        log(budgets.toString());
      } else {
        log("Error fetching budgets");
        // throw some kind of error
      }
    } catch (e) {
      throw Exception('Failed to load budgets: $e');
    }
  }
}
