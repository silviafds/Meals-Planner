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

  List<Dishes> _dishes = [];
  List<Dishes> _filteredBySearchDishes = [];

  Future<void> getDishes() async {
    try {
      _dishes = await _dishesRepository.getDishes();
      _filteredBySearchDishes = _dishes;
      _dishesListSubject.sink.add(_filteredBySearchDishes);
    } on HttpException catch (_) {
      rethrow;
    } catch (_) {
      rethrow;
    }
  }

  void filterDishesBySearch(String search) {
    if (search.isNotEmpty) {
      if (_dishes.isNotEmpty) {
        _filteredBySearchDishes = _dishes
            .where((dish) =>
                dish.nome.toLowerCase().contains(search.toLowerCase()))
            .toList();
      }
    } else {
      _filteredBySearchDishes = _dishes;
    }
    _dishesListSubject.sink.add(_filteredBySearchDishes);
  }
}
