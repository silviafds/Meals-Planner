import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/text/textStyles/app_textstyles.dart';
import 'widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'MealsPlanner',
                style: AppTextStyles.logoTextStyle,
              ),
              const SizedBox(
                height: 50,
              ),
              const LoginForm(),
              TextButton(
                  onPressed: () =>
                      Modular.to.pushReplacementNamed('/register-screen/'),
                  child: const Text('Sign up'))
            ],
          ),
        ),
      ),
    );
  }
}
