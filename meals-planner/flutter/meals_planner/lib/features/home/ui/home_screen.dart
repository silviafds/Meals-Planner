import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MealsPlanner'),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).pushReplacementNamed('/'),
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: const Center(
        child: Text('HomeScreen'),
      ),
    );
  }
}
