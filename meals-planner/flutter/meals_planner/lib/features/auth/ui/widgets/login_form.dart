import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../interactor/blocs/auth_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _authBloc = Modular.get<AuthBloc>();
  final _formKey = GlobalKey<FormState>();
  final _formData = <String, String>{};
  bool _isPasswordHidden = true;

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  void initState() {
    _emailTextController.text = '';
    _passwordTextController.text = '';
    _formData.clear();
    super.initState();
  }

  void _validateForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formData['email'] = _emailTextController.text;
    _formData['password'] = _passwordTextController.text;

    try {
      await _authBloc.login(_formData);
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
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Erro ao tentar logar!')));
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
                      return 'Insira um email';
                    } else if (!value.contains('@')) {
                      return 'Insira um email válido';
                    } else {
                      return null;
                    }
                  } else {
                    return 'Insira um email';
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
                  hintText: 'Senha',
                ),
                validator: (value) {
                  if (value != null) {
                    if (value.isEmpty) {
                      return 'Insira uma senha';
                    } else {
                      return null;
                    }
                  } else {
                    return 'Insira uma senha';
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
                child: Container(
                  alignment: Alignment.center,
                  width: 200,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    'Entrar',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
