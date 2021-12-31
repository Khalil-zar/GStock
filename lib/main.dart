import 'package:flutter/material.dart';
import 'package:frontend/auth/register.dart';
import 'package:frontend/home/drawer.dart';
import 'package:frontend/home/home.dart';
import 'auth/login.dart';
import 'package:frontend/home/family/family.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/home': (context) => const MyHome(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
      },
    );
  }
}
