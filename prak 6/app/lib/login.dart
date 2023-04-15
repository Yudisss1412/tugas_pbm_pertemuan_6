import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  List<Map<String, String>> accountList = [];

  void tryLogin(BuildContext context) {
    if (accountList.isNotEmpty &&
        usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      for (var i in accountList) {
        if (i['username'] == usernameController.text &&
            i['password'] == passwordController.text) {
          Navigator.pushReplacementNamed(context, '/home',
              arguments: usernameController.text);
        }
      }
    }
  }

  void register(String username, String password) {
    accountList.add({"username": username, "password": password});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 60,
            ),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(hintText: 'Username'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () => tryLogin(context),
            ),
            TextButton(
              child: const Text('Sign Up'),
              onPressed: () => Navigator.pushNamed(context, '/register',
                  arguments: register),
            )
          ],
        ),
      ),
    );
  }
}
