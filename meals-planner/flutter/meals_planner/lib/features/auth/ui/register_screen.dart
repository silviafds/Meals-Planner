import 'package:flutter/material.dart';

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
              const Text(
                'MealsPlanner',
                style: TextStyle(fontSize: 60, color: Colors.blue),
              ),
              const SizedBox(
                height: 20,
              ),
              const CircleAvatar(
                radius: 100,
                child: Text('Imagem'),
              ),
              const SizedBox(
                height: 20,
              ),
              const RegisterForm(),
              TextButton(
                  onPressed: () => Navigator.of(context)
                      .pushReplacementNamed('/login-screen'),
                  child: const Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
