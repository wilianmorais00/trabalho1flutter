import 'package:app1/components/menu.dart';
import 'package:flutter/material.dart';
import 'components/menu.dart';

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Perfil",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: const Color.fromARGB(255, 141, 204, 255),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 50, left: 50, right: 50),
              child: Text(
                """
                   Nome: Wilian da Silva Morais
                   Idade: 25
                   Profissão: Analista em Garantia
                   Altura: 1,82 m
                   Peso: Só Deus Sabe
                   
                   Aplicativo desenvolvido para avaliação de flutter
                   """,
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 30, left: 60, right: 60),
            child: Image.asset('assets/imagens/uniSenai.png'),
          )
        ],
      ),
      bottomNavigationBar: const Menu(),
    );
  }
}
