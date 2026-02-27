import 'package:flutter/material.dart';
import 'screens/home/home_screen.dart';

void main() => runApp(const IndiawishApp());

class IndiawishApp extends StatelessWidget {
  const IndiawishApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'indiawish',
      theme: ThemeData(useMaterial3: true, scaffoldBackgroundColor: Colors.white),
      home: const HomeScreen(),
    );
  }
}
