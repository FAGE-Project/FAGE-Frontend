import 'package:fage/components/list_tile/empresa_list_tile.dart';
import 'package:fage/controller/empresa_controller.dart';
import 'package:flutter/material.dart';

import '../components/custom_text_form_field.dart';

class MyFage extends StatelessWidget {
  const MyFage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextFormField(
            labelText: "Pesquisar", prefixIcon: Icons.search),
        const SizedBox(height: 10),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Column(
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.transparent,
                      minRadius: 45,
                      backgroundImage:
                          AssetImage("assets/images/barbeiro.jpg")),
                  SizedBox(height: 10),
                  Text("Barbearias")
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.transparent,
                      minRadius: 45,
                      backgroundImage:
                          AssetImage("assets/images/barbeiro.jpg")),
                  SizedBox(height: 10),
                  Text("Salões de\nbeleza", textAlign: TextAlign.center)
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.transparent,
                      minRadius: 45,
                      backgroundImage:
                          AssetImage("assets/images/barbeiro.jpg")),
                  SizedBox(height: 10),
                  Text(
                    "Saúde &\nBem-estar",
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.transparent,
                      minRadius: 45,
                      backgroundImage:
                          AssetImage("assets/images/barbeiro.jpg")),
                  SizedBox(height: 10),
                  Text(
                    "Spa &\nmassagem",
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 440,
          child: FutureBuilder(
            future: EmpresaController.buscarEmpresas(),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemBuilder: (context, index) => EmpresaListTile(
                    title: snapshot.data![index].nome!,
                    foto: snapshot.data![index].foto!,
                    descricao: snapshot.data![index].descricao!,
                    aberta: snapshot.data![index].aberta!,
                    documento: snapshot.data![index].documento!,
                    nota: snapshot.data![index].nota!,
                    id: snapshot.data![index].id!,
                  ),
                  itemCount: snapshot.data!.length,
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        )
      ],
    );
  }
}
