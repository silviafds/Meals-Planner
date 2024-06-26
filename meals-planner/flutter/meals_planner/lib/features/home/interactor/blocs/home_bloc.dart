import 'dart:io';

import 'package:rxdart/subjects.dart';

import '../../../../core/entities/dishes.dart';
import '../../../auth/data/auth_repository.dart';
import '../../data/dishes_repository.dart';

class HomeBloc {
  final AuthRepository _authRepository;
  final DishesRepository _dishesRepository;
  HomeBloc(this._authRepository, this._dishesRepository);

  final _dishesListSubject = BehaviorSubject<List<Dishes>>.seeded([]);

  Stream<List<Dishes>> get dishes => _dishesListSubject.stream;

  Future<void> logout() async {
    _authRepository.logout();
  }

  Future<void> getDishes() async {
    try {
      final dishes = await _dishesRepository.getDishes();
      _dishesListSubject.sink.add(dishes);
    } on HttpException catch (_) {
      rethrow;
    } catch (_) {
      rethrow;
    }
  }
}
