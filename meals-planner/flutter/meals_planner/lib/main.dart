import "package:flutter/material.dart";
import "package:flutter_config/flutter_config.dart";
import "package:flutter_modular/flutter_modular.dart";

import "app_module.dart";
import "core/colors/app_colors.dart";

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
        colorScheme: ColorScheme.light(primary: AppColors.mainColor),
        primaryColor: AppColors.mainColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.mainColor),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: AppColors.mainColor),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
