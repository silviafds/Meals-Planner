import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as httpClient;

import '../../../core/entities/user.dart';

class AuthRepository {
  final _user = User();
  final _url = 'http://mealsplaner.com/api/v1';

  void registerUser(Map<String, String> userData) async {
    final response = await httpClient.post(Uri.parse('$_url/cadastro'),
        body: jsonEncode(userData));

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      _user.updateName(data['name']);
      _user.updateToken(data['token']);
    } else {
      throw const HttpException(
          'Erro ao tentar cadastrar usuário. Tente novamente!');
    }
  }

  void login(Map<String, String> userData) async {
    // final response = await httpClient.post(Uri.parse('$_url/login'),
    //     body: jsonEncode(userData));
    final body = json.encode({
      'name': 'Hilton',
      'token': 'HasmaADenkjbDANA',
    });
    final response = Response(200, body);

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
