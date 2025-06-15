import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'models/sign_in_request.dart';
import 'models/authenticated_user.dart';
import 'models/sign_up_request.dart';

class AuthService {
  final _storage = const FlutterSecureStorage();
  final String _baseUrl = 'https://managewise-backend-hfadgugthcc2erdd.centralus-01.azurewebsites.net';

  Future<AuthenticatedUser?> signIn(SignInRequest request) async {
    final url = Uri.parse('$_baseUrl/api/v1/authentication/sign-in');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final user = AuthenticatedUser.fromJson(json);

      // Guardar el token de forma segura
      await _storage.write(key: 'auth_token', value: user.token);
      return user;
    } else {
      return null;
    }
  }

  Future<bool> signUp(SignUpRequest request) async {
    final url = Uri.parse('$_baseUrl/api/v1/authentication/sign-up');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );

    return response.statusCode == 201;
  }

  Future<void> signOut() async {
    await _storage.delete(key: 'auth_token');
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'auth_token');
  }
}
