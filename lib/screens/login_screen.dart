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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); // for validation and other purposes
  bool isLogin = true; // to know if user is logging in or signing up

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Switch title bar text accordingly
      appBar: AppBar(
        title: isLogin ? const Text('Login') : const Text('Sign Up'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            // email field
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                label: Text('email'),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: _emailValidator,
            ),
            // password field
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                label: Text('Password'),
              ),
              validator: _passwordValidator,
            ),
            // login button
            ElevatedButton(
              onPressed: _submitForm,
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

  // Function that will trigger once the form needs to be submitted
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // if in login mode, try logging in
      if (isLogin) {
        Provider.of<User>(context, listen: false)
            .login(_emailController.text, _passwordController.text, context);
      }
      // otherwise, sign up
      else {
        Provider.of<User>(context, listen: false)
            .signup(_emailController.text, _passwordController.text, context);
      }
    }
  }
}

// Validation for email field
String? _emailValidator(String? value) {
  // If the field is empty
  if (value == null || value.isEmpty) {
    return 'Email can\'t be empty';
  }
  // Checking for general format of email
  if (!value.contains(RegExp(r'^[A-Za-z0-9]*@[A-Za-z]*\.[A-Za-z]*$'))) {
    return 'No special characters allowed';
  }
  return null;
}

// Validation for password field
String? _passwordValidator(String? value) {
  // If the field is empty
  if (value == null || value.isEmpty) {
    return 'Password can\'t be empty';
  }
  // If field is less than 8 characters long
  if (value.length < 8) {
    return 'Password must be at least 8 characters long';
  }
  // Check for digits
  if (!value.contains(RegExp(r'[0-9]'))) {
    return 'Password must contain at least one number';
  }
  // Check for special characters
  if (!value.contains(RegExp(r'[^A-Za-z0-9 ]'))) {
    return 'Password must contain at least one special character';
  }
  return null;
}
