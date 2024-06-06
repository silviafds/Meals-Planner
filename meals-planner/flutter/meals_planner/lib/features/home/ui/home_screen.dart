import 'package:flutter/material.dart';

import '../interactor/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final _homeController = HomeController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('MealsPlanner'),
        actions: [
          IconButton(
              onPressed: () async {
                await _homeController.logout();

                if (!mounted) return;

                Navigator.of(context).pushReplacementNamed('/');
              },
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: const Center(
        child: Text('HomeScreen'),
      ),
    );
  }
}
