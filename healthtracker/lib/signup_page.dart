import 'package:flutter/material.dart';
import 'auth_service.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _signup(context);
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }

  void _signup(BuildContext context) async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String result = await _authService.signUpWithEmailAndPassword(email, password);
    if (result == 'success') {
      // Navigate to the login page or the next screen after successful signup
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result)),
      );
    }
  }
}
