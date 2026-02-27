import 'package:flutter/material.dart';
import 'screens/home/home_screen.dart';

void main() => runApp(const OlxCloneApp());

class OlxCloneApp extends StatelessWidget {
  const OlxCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OLX Clone',
      theme: ThemeData(useMaterial3: true, scaffoldBackgroundColor: Colors.white),
      home: const HomeScreen(),
    );
  }
}
