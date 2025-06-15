import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/epic.dart';
import '../models/user_story.dart';

class BacklogService {
  final String baseUrl = 'https://managewise-backend-hfadgugthcc2erdd.centralus-01.azurewebsites.net/api/v1';
  final _storage = const FlutterSecureStorage();

  Future<String?> _getToken() async {
    return await _storage.read(key: 'auth_token');
  }

  Future<List<Epic>> fetchEpics() async {
    final token = await _getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/epics'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final List jsonList = json.decode(response.body);
      return jsonList.map((e) => Epic.fromJson(e)).toList();
    }
    throw Exception('Error fetching epics');
  }

  Future<List<UserStory>> fetchUserStories() async {
    final token = await _getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/user-stories'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final List jsonList = json.decode(response.body);
      return jsonList.map((e) => UserStory.fromJson(e)).toList();
    }
    throw Exception('Error fetching user stories');
  }

  Future<void> createEpic(String title, String description) async {
    final token = await _getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/epics'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'title': title, 'description': description}),
    );
    if (response.statusCode != 201 && response.statusCode != 200) {
      throw Exception('Error creating epic');
    }
  }

  Future<void> createUserStory(String title, String description, int effort) async {
    final token = await _getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/user-stories'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'title': title,
        'description': description,
        'epicId': 1, // Cambiar según sea necesario
        'sprintId': 1, // Cambiar según sea necesario
        'effort': effort
      }),
    );
    if (response.statusCode != 201 && response.statusCode != 200) {
      throw Exception('Error creating user story');
    }
  }
}
