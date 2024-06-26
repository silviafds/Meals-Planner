import 'dart:convert';
import 'dart:io';

import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;

import '../../../core/entities/user.dart';

class AuthRepository {
  final User _user;
  AuthRepository(this._user);
  final _url = FlutterConfig.get('API_URL');
  final _registerEndpoint = FlutterConfig.get('SIGN_UP_ENDPOINT');
  final _loginEndpoint = FlutterConfig.get('LOGIN_ENDPOINT');

  Future<void> registerUser(Map<String, String> userData) async {
    final response = await http.post(Uri.http(_url, _registerEndpoint),
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
    final response = await http.post(Uri.http(_url, _loginEndpoint),
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
