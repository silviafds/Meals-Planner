import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as httpClient;

import '../../../core/entities/user.dart';

class AuthRepository {
  final _user = User();
  final _url = 'http://192.168.0.153:8080/auth';

  Future<void> registerUser(Map<String, String> userData) async {
    final response = await httpClient.post(Uri.parse('$_url/cadastro'),
        body: jsonEncode({
          'name': userData['name'],
          'email': userData['email'],
          'password': userData['password']
        }),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      _user.updateName(data['name']);
      _user.updateToken(data['token']);
    } else {
      throw const HttpException(
          'Erro ao tentar cadastrar usuário. Tente novamente!');
    }
  }

  Future<void> login(Map<String, String> userData) async {
    final response = await httpClient.post(Uri.parse('$_url/login'),
        body: jsonEncode(userData),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      _user.updateName(data['name']);
      _user.updateToken(data['token']);
    } else {
      throw const HttpException(
          'Erro ao tentar realizar login. Tente novamente!');
    }
  }

  void logout() async {
    _user.updateName(null);
    _user.updateToken(null);
  }
}

class Response {
  int statusCode;
  String body;

  Response(this.statusCode, this.body);
}
