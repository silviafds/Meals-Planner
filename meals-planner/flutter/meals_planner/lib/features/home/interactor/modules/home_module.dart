import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/entities/user.dart';
import '../../../auth/data/auth_repository.dart';
import '../../data/dishes_repository.dart';
import '../../ui/home_screen.dart';
import '../blocs/home_bloc.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<User>(User.new);
    i.addSingleton<HomeBloc>(HomeBloc.new);
    i.add<AuthRepository>(AuthRepository.new);
    i.add<DishesRepository>(DishesRepository.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomeScreen());
  }
}
