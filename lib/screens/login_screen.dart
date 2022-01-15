import 'package:flutter/material.dart';

import './home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                label: Text('Username'),
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                label: Text('Password'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
