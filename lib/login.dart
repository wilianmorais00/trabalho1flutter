import 'package:flutter/material.dart';
import 'home.dart';

class Logar extends StatelessWidget {
  Logar({super.key});

  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passController = TextEditingController();

  void _login(BuildContext context) {
    final user = _userController.text.trim();
    final pass = _passController.text;

    if (user == 'admin' && pass == '123') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login bem sucedido!')),
      );
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('usuário ou senha incorreto')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 141, 204, 255),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/imagens/uniSenai.png',
                  width: 200,
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: _userController,
                  decoration: const InputDecoration(
                    labelText: 'Usuário',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () => _login(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1d3484),
                    minimumSize: const Size(150, 44),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
