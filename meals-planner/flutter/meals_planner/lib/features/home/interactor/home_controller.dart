import '../../auth/data/auth_repository.dart';

class HomeController {
  final _authRepository = AuthRepository();

  Future<void> logout() async {
    _authRepository.logout();
  }
}
