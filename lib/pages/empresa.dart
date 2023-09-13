import 'package:flutter/material.dart';

class EmpresaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Empresa'),
      ),
      body: FutureBuilder(
        future: fetchDataFromApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Erro: ${snapshot.error}');
          } else {
            final String nomeEmpresa = 'Nome da Empresa';
            final String status = 'Status da Empresa';
            final String imageUrl ='https://static0.gamerantimages.com/wordpress/wp-content/uploads/2022/08/Untitled-design(35).jpg';

            return Column(
              children: [
                Expanded(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nomeEmpresa,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        status,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Future<void> fetchDataFromApi() async {
    await Future.delayed(Duration(seconds: 2));
  }
}

void main() {
  runApp(MaterialApp(
    home: EmpresaScreen(),
  ));
}
