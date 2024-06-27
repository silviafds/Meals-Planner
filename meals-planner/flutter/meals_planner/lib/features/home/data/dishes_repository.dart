import 'dart:convert';

import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;

import '../../../core/entities/dishes.dart';
import '../../../core/entities/user.dart';

class DishesRepository {
  final User _user;

  DishesRepository(this._user);
  final _url = FlutterConfig.get('API_URL');
  final _getDishesEndpoint = FlutterConfig.get('DISHES_ENDPOINT');

  Future<List<Dishes>> getDishes() async {
    final response =
        await http.get(Uri.http(_url, _getDishesEndpoint), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${_user.userToken}',
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
      List<Dishes> dishes = [];

      for (var dish in data) {
        final meal = Dishes(
            id: dish['id'],
            nome: dish['nome'],
            categoria: dish['categoria'],
            calorias: dish['calorias'],
            peso: dish['peso'],
            carboidratos: dish['carboidratos'],
            sodio: dish['sodio'],
            proteinas: dish['proteinas'],
            gordurasTotais: dish['gordurasTotais'],
            gorduraSaturada: dish['gorduraSaturada']);
        dishes.add(meal);
      }
      return dishes;
    }
    return [];
  }
}
