
import 'package:fage_telas/pages/inicialSimulado.dart';
import 'package:fage_telas/pages/login.dart';
import 'package:flutter/material.dart';

class Rotas extends StatelessWidget {
  const Rotas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rotas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => Login(),
        'home': (context) => InicialSimulado(),
      },
    );
  }
}
