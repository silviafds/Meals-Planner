import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/text/textStyles/app_textstyles.dart';
import 'widgets/register_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'MealsPlanner',
                style: AppTextStyles.logoTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              CircleAvatar(
                radius: 100,
                backgroundColor: Colors.purple.shade200,
                foregroundColor: Colors.white,
                child: const Text('Imagem'),
              ),
              const SizedBox(
                height: 20,
              ),
              const RegisterForm(),
              TextButton(
                  onPressed: () =>
                      Modular.to.pushReplacementNamed('/login-screen'),
                  child: const Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
