import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments as Function(
        String username, String password);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sign Up',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(
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
                child: const Text('Sign Up'),
                onPressed: () {
                  if (usernameController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    argument(usernameController.text, passwordController.text);
                    Navigator.of(context).pop();
                  }
                }),
            TextButton(
              child: const Text('Sign In'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    );
  }
}
