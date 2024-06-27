import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/entities/user.dart';
import '../../data/auth_repository.dart';

class AuthBloc {
  final AuthRepository _authRepository;
  final User _user;
  AuthBloc(this._authRepository, this._user);

  Future<void> login(Map<String, String> loginInfo) async {
    try {
      await _authRepository.login(loginInfo).then((_) {
        if (_user.userToken != null) {
          Modular.to.pushReplacementNamed('home/');
        }
      });
    } on HttpException catch (e) {
      print(e);
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> registerUser(Map<String, String> signUpInfo) async {
    try {
      await _authRepository.registerUser(signUpInfo).then((_) {
        if (_user.userToken != null) {
          Modular.to.pushReplacementNamed('/home');
        }
      });
    } on HttpException catch (_) {
      rethrow;
    } catch (_) {
      rethrow;
    }
  }
}
