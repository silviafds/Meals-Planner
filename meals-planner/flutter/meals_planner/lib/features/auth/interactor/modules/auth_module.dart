import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/entities/user.dart';
import '../../../home/interactor/modules/home_module.dart';
import '../../data/auth_repository.dart';
import '../../ui/auth_screen.dart';
import '../../ui/login_screen.dart';
import '../../ui/register_screen.dart';
import '../blocs/auth_bloc.dart';

class AuthModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<User>(User.new);
    i.addSingleton<AuthBloc>(AuthBloc.new);
    i.add<AuthRepository>(AuthRepository.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const AuthScreen());
    r.child('/register-screen', child: (context) => const RegisterScreen());
    r.child('/login-screen', child: (context) => const LoginScreen());
    r.module('/home', module: HomeModule());
  }
}
