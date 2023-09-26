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
        Container(
          height: 200,
          child: FutureBuilder(
            future: EmpresaController.buscarEmpresas(),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemBuilder: (context, index) =>
                      Text(snapshot.data![index].nome!),
                  itemCount: snapshot.data!.length,
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        )
      ],
    );
  }
}
