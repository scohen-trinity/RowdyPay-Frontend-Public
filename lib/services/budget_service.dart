import 'package:http/http.dart' as http;
class BudgetService {
  static const String _apiUrl = 'http://localhost:3000/api';

  Future<void> getBudget() async {

    try {
      final response = await http.get(Uri.parse('$_apiUrl/budget'));

      if (response.statusCode == 200) {
        // do some stuff
      } else {
        // throw some kind of error
      }
    } catch (e) {
      throw Exception('Failed to load budgets: $e');
    }
  }
}
