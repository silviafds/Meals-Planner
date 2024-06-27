import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/entities/dishes.dart';
import '../../../core/text/textStyles/app_textstyles.dart';
import '../interactor/blocs/home_bloc.dart';
import 'widgets/dish_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeBloc = Modular.get<HomeBloc>();
  final _searchTextController = TextEditingController();
  final _searchTextFieldFocusNode = FocusNode();

  @override
  void initState() {
    _searchTextController.text = '';
    _getDishesList();
    super.initState();
  }

  void _getDishesList() async {
    try {
      await _homeBloc.getDishes();
    } on HttpException catch (e) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    } catch (e) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black87),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Olá, Fulano',
          style: AppTextStyles.homeScreenGreetingsTextStyle,
        ),
        toolbarHeight: 80,
        actions: const [
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 30,
            foregroundImage: AssetImage('assets/images/profile-picture.jpeg'),
          ),
          SizedBox(
            width: 30,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade400),
                child: TextField(
                  focusNode: _searchTextFieldFocusNode,
                  controller: _searchTextController,
                  decoration: InputDecoration(
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      suffixIcon: IconButton(
                          onPressed: () {
                            _searchTextFieldFocusNode.hasPrimaryFocus
                                ? _searchTextFieldFocusNode.unfocus()
                                : null;
                            _homeBloc.filterDishesBySearch(
                                _searchTextController.text);
                          },
                          icon: const Icon(Icons.search)),
                      hintText: 'Search'),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Meus pratos',
                  style: TextStyle(fontSize: 34),
                ),
                Text('filtros'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: StreamBuilder<List<Dishes>>(
                  stream: _homeBloc.dishes,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final dishes = snapshot.data;

                      if (dishes!.isEmpty) {
                        return const Center(
                          child: Text(
                            'Nenhum prato cadastrado',
                            style: AppTextStyles.homeScreenGreetingsTextStyle,
                          ),
                        );
                      } else {
                        return ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 40,
                          ),
                          itemCount: dishes.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () => Modular.to.pushNamed('dish-details',
                                arguments: dishes[index]),
                            child: DishCard(
                              dish: dishes[index],
                            ),
                          ),
                        );
                      }
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
      drawer: Drawer(
        elevation: 10,
        backgroundColor: AppColors.mainColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            child: Stack(children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade400,
                      radius: 70,
                      foregroundImage: const AssetImage(
                          'assets/images/profile-picture.jpeg'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Olá, CJ',
                      style: AppTextStyles.homeScreenGreetingsTextStyle,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        var currentRoute = Modular.to.navigateHistory.last;
                        if (currentRoute.name != '/home/') {
                          Modular.to.navigate('/home/');
                        } else {
                          Modular.to.pop();
                        }
                      },
                      child: const Text('Meus pratos',
                          style: AppTextStyles.drawerItemsTextStyle),
                    ),
                    const TextButton(
                      onPressed: null,
                      child: Text('Minhas refeições',
                          style: AppTextStyles.drawerItemsTextStyle),
                    ),
                    const TextButton(
                        onPressed: null,
                        child: Text('Meus alimentos',
                            style: AppTextStyles.drawerItemsTextStyle)),
                    const TextButton(
                        onPressed: null,
                        child: Text('Minhas bebidas',
                            style: AppTextStyles.drawerItemsTextStyle)),
                    const TextButton(
                        onPressed: null,
                        child: Text('Configurações',
                            style: AppTextStyles.drawerItemsTextStyle)),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton.icon(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black, iconColor: Colors.black),
                    onPressed: () async {
                      await _homeBloc
                          .logout()
                          .then((_) => Modular.to.pushReplacementNamed('/'));
                    },
                    icon: const Icon(
                      Icons.logout_outlined,
                    ),
                    label: const Text(
                      'Logout',
                      style: TextStyle(fontSize: 20),
                    )),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
