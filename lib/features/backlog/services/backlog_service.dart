import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/epic.dart';
import '../models/user_story.dart';

class BacklogService {
  final String baseUrl = 'http://10.0.2.2:8090/api/v1';

  Future<List<Epic>> fetchEpics() async {
    final response = await http.get(Uri.parse('$baseUrl/epics'));
    if (response.statusCode == 200) {
      final List jsonList = json.decode(response.body);
      return jsonList.map((e) => Epic.fromJson(e)).toList();
    }
    throw Exception('Error fetching epics');
  }

  Future<List<UserStory>> fetchUserStories() async {
    final response = await http.get(Uri.parse('$baseUrl/user-stories'));
    if (response.statusCode == 200) {
      final List jsonList = json.decode(response.body);
      return jsonList.map((e) => UserStory.fromJson(e)).toList();
    }
    throw Exception('Error fetching user stories');
  }

  Future<void> createEpic(String title, String description) async {
    await http.post(
      Uri.parse('$baseUrl/epics'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'title': title, 'description': description}),
    );
  }

  Future<void> createUserStory(String title, String description, int effort) async {
    await http.post(
      Uri.parse('$baseUrl/user-stories'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': title,
        'description': description,
        'epicId': 1, // cambiar si deseas asociarlo dinámicamente
        'sprintId': 1, // idem
        'effort': effort
      }),
    );
  }
}
