import 'package:flutter/material.dart';

import 'widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'MealsPlanner',
                style: TextStyle(fontSize: 60, color: Colors.blue),
              ),
              const SizedBox(
                height: 50,
              ),
              const LoginForm(),
              TextButton(
                  onPressed: () => Navigator.of(context)
                      .pushReplacementNamed('/register-screen'),
                  child: const Text('Sign up'))
            ],
          ),
        ),
      ),
    );
  }
}
