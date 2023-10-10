import 'package:fage/components/list_tile/empresa_list_tile.dart';
import 'package:fage/components/list_tile/title_empresa_list_tile.dart';
import 'package:fage/controller/empresa_controller.dart';
import 'package:flutter/material.dart';

class Empresa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Empresa'),
      ),
      body: FutureBuilder(
        future: EmpresaController.buscarEmpresaId(id),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Image.network(
                  snapshot.data!.foto!,
                  scale: 2,
                ),
                Column(
                  children: [
                    TitleEmpresaListTile(
                        nomeEmpresa: snapshot.data!.nome!,
                        endereco:
                            '${snapshot.data!.enderecoDTO.rua}, ${snapshot.data!.enderecoDTO.numero}, ${snapshot.data!.enderecoDTO.cep}, ${snapshot.data!.enderecoDTO.cidade!}'),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, Routes.agendamento),
                      child: Text(
                        'Agendar serviços',
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('Erro: ${snapshot.error}');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<void> fetchDataFromApi() async {
    await Future.delayed(Duration(seconds: 2));
  }
}
