import "package:flutter/material.dart";
import "package:flutter_config/flutter_config.dart";
import "package:flutter_modular/flutter_modular.dart";

import "app_module.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();
  runApp(ModularApp(module: AppModule(), child: const MealsPlannerApp()));
}

class MealsPlannerApp extends StatelessWidget {
  const MealsPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Meals Planner',
      routerConfig: Modular.routerConfig,
      theme: ThemeData(
        colorScheme: ColorScheme.light(primary: Colors.purple.shade300),
        primaryColor: Colors.purple.shade300,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style:
              ElevatedButton.styleFrom(backgroundColor: Colors.purple.shade300),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.purple.shade300),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
