import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meal_planner/features/auth/interactor/blocs/auth_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _authBloc = Modular.get<AuthBloc>();
  final _formKey = GlobalKey<FormState>();
  final _formData = <String, String>{};
  bool _isPasswordHidden = true;

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  void initState() {
    _nameTextController.text = '';
    _emailTextController.text = '';
    _passwordTextController.text = '';
    _formData.clear();
    super.initState();
  }

  void _validateForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formData['name'] = _nameTextController.text;
    _formData['email'] = _emailTextController.text;
    _formData['password'] = _passwordTextController.text;

    try {
      await _authBloc.registerUser(_formData);
    } on HttpException catch (exception) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(exception.message)));
    } catch (e) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erro ao tentar registrar usuário!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nameTextController,
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'Name',
                ),
                validator: (value) {
                  if (value != null) {
                    if (value.isEmpty) {
                      return 'Insert a name';
                    } else {
                      return null;
                    }
                  } else {
                    return 'Insert a name';
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _emailTextController,
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'Email',
                ),
                validator: (value) {
                  if (value != null) {
                    if (value.isEmpty) {
                      return 'Insert an email';
                    } else if (!value.contains('@')) {
                      return 'Insert a valid email';
                    } else {
                      return null;
                    }
                  } else {
                    return 'Insert an email';
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordTextController,
                obscureText: _isPasswordHidden,
                decoration: InputDecoration(
                  isDense: true,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordHidden = !_isPasswordHidden;
                      });
                    },
                    iconSize: 24,
                    icon: Icon(
                      _isPasswordHidden
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'Password',
                ),
                validator: (value) {
                  if (value != null) {
                    if (value.isEmpty) {
                      return 'Insert a password';
                    } else {
                      return null;
                    }
                  } else {
                    return 'Insert a password';
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  _validateForm();
                },
                child: const Text(
                  'Sign up',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
