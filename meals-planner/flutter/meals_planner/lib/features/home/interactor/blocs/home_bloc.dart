import '../../../auth/data/auth_repository.dart';

class HomeBloc {
  final AuthRepository _authRepository;
  HomeBloc(this._authRepository);

  Future<void> logout() async {
    _authRepository.logout();
  }
}
