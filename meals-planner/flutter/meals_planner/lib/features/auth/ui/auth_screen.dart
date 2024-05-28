import 'package:flutter/material.dart';

import '../../home/ui/home_screen.dart';
import 'login_screen.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});
  bool isLogged = false;
  @override
  Widget build(BuildContext context) {
    return isLogged ? const HomeScreen() : const LoginScreen();
  }
}
