import "package:flutter/material.dart";

import "features/auth/ui/auth_screen.dart";
import "features/auth/ui/login_screen.dart";
import "features/auth/ui/register_screen.dart";
import "features/home/ui/home_screen.dart";

void main() {
  runApp(const MealsPlannerApp());
}

class MealsPlannerApp extends StatelessWidget {
  const MealsPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      routes: {
        '/': (context) => AuthScreen(),
        '/home': (context) => const HomeScreen(),
        '/login-screen': (context) => const LoginScreen(),
        '/register-screen': (context) => const RegisterScreen(),
      },
    );
  }
}
