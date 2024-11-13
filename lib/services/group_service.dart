import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:receipt_sharing/models/group_model.dart';

class GroupService {
  static const String _apiUrl = 'http://localhost:9000/api';
  static const userId = 1;

  static final GroupService _instance = GroupService._internal();
  factory GroupService() => _instance;
  GroupService._internal();

  ValueNotifier<List<Group>> groups = ValueNotifier<List<Group>>([]);

  Future<void> getGroups() async {
    try {
      final response = await http.get(Uri.parse('$_apiUrl/get_groups/$userId'));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        groups.value =
            jsonResponse.map((data) => Group.fromJson(data)).toList();
      } else {
        log("Error fetching groups");
        // TODO implement error handlingl for when group retrieval fails
      }
    } catch (e) {
      throw Exception('Failed to load groups: $e');
    }
  }

  Future<void> createGroup(
      String name, List<String> participants, IconData icon) async {
    GroupDTO payload =
        GroupDTO(name: name, participants: participants, icon: icon.codePoint);

    try {
      final response = await http.post(
        Uri.parse('$_apiUrl/addGroup'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload.toJson()),
      );

      if (response.statusCode == 200) {
        Group group = Group.fromJson(jsonDecode(response.body));
        groups.value = [...groups.value, group];
      } else {
        log("Error adding to groups");
      }
    } catch (e) {
      throw Exception('Failed to connect to groups: $e');
    }
  }
}
