import 'package:fage/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/fage-logo-white.png", scale: 2),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CustomTextFormField(labelText: "Pesquisar", prefixIcon: Icons.search),
          CustomTextFormField(labelText: "Pesquisar", prefixIcon: Icons.search),
          ListTile(
            title: Text("Teste"),
          ),
        ],
      ),
    );
  }
}
