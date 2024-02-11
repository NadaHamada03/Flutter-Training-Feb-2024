import 'package:flutter/material.dart';
import 'package:task2/screens/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(), // Set your initial screen here
    );
  }
}
