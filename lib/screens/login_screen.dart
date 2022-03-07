import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // controllers to hold the text values from the text field
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); // for validation and other purposes
  bool isLogin = true; // to know if user is logging in or signing up

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLogin ? const Text('Login') : const Text('Sign Up'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            // email field
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                label: Text('email'),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            // password field
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                label: Text('Password'),
              ),
            ),
            // login button
            ElevatedButton(
              onPressed: () async {
                // make sure there are no errors first
                if (_formKey.currentState!.validate()) {
                  // if in login mode, try logging in
                  if (isLogin) {
                    Provider.of<User>(context, listen: false).login(
                        emailController.text, passwordController.text, context);
                  }
                  // otherwise, sign up
                  else {
                    Provider.of<User>(context, listen: false).signup(
                        emailController.text, passwordController.text, context);
                  }
                  // Navigator.pushReplacementNamed(context, '/');
                }
              },
              child: Text(isLogin ? 'Login' : 'Signup'),
            ),
            // change to login/signup button
            TextButton(
                onPressed: () {
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
                child: Text('${isLogin ? 'Signup' : 'login'} instead')),
          ],
        ),
      ),
    );
  }
}
