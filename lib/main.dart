import 'package:flutter/material.dart';
import 'components/menu.dart';
import 'home.dart';
import 'calculadora.dart';
import 'sobre.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Logar(),
        '/login': (context) => Logar(),
        '/home': (context) => const Home(title: 'Início'),
        '/calculadora': (context) => Calculadora(),
        '/sobre': (context) => const Sobre(),
      },
    );
  }
}
