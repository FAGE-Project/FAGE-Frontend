import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ListaEmpresas extends StatefulWidget {
  @override
  _ListaEmpresasState createState() => _ListaEmpresasState();
}

class _ListaEmpresasState extends State<ListaEmpresas> {
  List<dynamic> empresas = []; // Lista para armazenar as empresas

  @override
  void initState() {
    super.initState();
    // Chama a função para buscar as empresas quando o widget for criado
    _getEmpresas();
  }

  Future<void> _getEmpresas() async {
    final response = await http.get(
      Uri.parse('https://e3a3-200-17-101-78.ngrok.io/empresa'),
    );

    if (response.statusCode == 200) {
      // Se a requisição for bem-sucedida, decodificamos a resposta JSON
      final List<dynamic> responseData = json.decode(response.body);
      setState(() {
        empresas = responseData; // Atualiza a lista de empresas
      });
    } else {
      // Se a requisição falhar, você pode tratar o erro aqui
      print('Erro na requisição: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Empresas'),
      ),
      body: ListView.builder(
        itemCount: empresas.length,
        itemBuilder: (context, index) {
          final empresa = empresas[index];
          return Card(
            child: ListTile(
              leading: Image.asset('assets/images/barbeiro.jpg'),
              title: Text(empresa['nome']),
              //subtitle: Text('Nota: ${empresa['nota']}'),
              //trailing: Text(empresa['descricao']),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EmpresaPage(empresa)));
              },
            ),
          );
        },
      ),
    );
  }
}

class EmpresaPage extends StatelessWidget {
  final dynamic empresa;

  EmpresaPage(this.empresa);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(empresa['nome']),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nome: ${empresa['nome']}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Nota: ${empresa['nota']}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Descrição: ${empresa['descricao']}', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}