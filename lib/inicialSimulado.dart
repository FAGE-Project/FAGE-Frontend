import 'package:flutter/material.dart';

class InicialSimulado extends StatelessWidget {
  const InicialSimulado({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tela Inicial')),
      body: ListView(
        children: [
          legenda(
            'https://images.ctfassets.net/hrltx12pl8hq/1fR5Y7KaK9puRmCDaIof7j/09e2b2b9eaf42d450aba695056793607/vector1.jpg?fit=fill&w=600&h=400', 
            'foto para não ficar sem nada',
             (){
              
             
             },
          ),
        ],
      ),
    );
  }

  Widget legenda(String url, String legenda, void Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Image.network(url),
          Text(legenda),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }


}

