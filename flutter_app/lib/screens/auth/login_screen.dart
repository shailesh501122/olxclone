import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Login')),
    body: const Padding(
      padding: EdgeInsets.all(16),
      child: Column(children: [
        TextField(decoration: InputDecoration(labelText: 'Email')),
        TextField(decoration: InputDecoration(labelText: 'Password')),
        SizedBox(height: 12),
        ElevatedButton(onPressed: null, child: Text('Login')), 
        OutlinedButton(onPressed: null, child: Text('Continue with Google')),
      ]),
    ),
  );
}
