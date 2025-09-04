import 'package:flutter/material.dart';
import 'components/menu.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ATIVIDADE",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 141, 204, 255),
      ),
      body: Center(
        child: Image.asset('assets/imagens/uniSenai.png'),
      ),
      bottomNavigationBar: const Menu(),
    );
  }
}
