import 'package:flutter/material.dart';

import '../components/custom_text_form_field.dart';

class MyFage extends StatelessWidget {
  const MyFage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTextFormField(labelText: "Pesquisar", prefixIcon: Icons.search),
        SizedBox(height: 10),
        SingleChildScrollView(
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
      ],
    );
  }
}
