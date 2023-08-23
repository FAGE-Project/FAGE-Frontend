import 'dart:html';

import 'package:fage_telas/components/TextFieldWithIcon.dart';
import 'package:fage_telas/util/Util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Cadastro_teste extends StatefulWidget {
  const Cadastro_teste({Key? key}) : super(key: key);

  @override
  State<Cadastro_teste> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro_teste> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PageController _pageController = PageController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController empresaController = TextEditingController();
  final TextEditingController cnpjController = TextEditingController();
  final TextEditingController cepController = TextEditingController();
  final TextEditingController enderecoController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController repetirSenhaController = TextEditingController();
  final TextEditingController numeroEnderecoController =TextEditingController();
  final TextEditingController estadoController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();
  final TextEditingController cargoController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "login",
      home: Scaffold(
          appBar: AppBar(
            title: Text('Cadastro Usuário'),
          ),
          body: SingleChildScrollView(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 600;
                return Row(
                  if(isMobile == true){
                    UserRegister();
                  }else{
                    return Expanded(
                      child: UserRegister(),
                    );
                  }
                );
              },
            ),
          )),
    );
  }

  Widget UserRegister() {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFieldWithIcon(
              controller: emailController,
              icon: Icons.email,
              label: 'E-mail',
            ),
            SizedBox(height: 16.0),
            TextFieldWithIcon(
              controller: empresaController,
              icon: Icons.business,
              label: 'Nome da Empresa',
            ),
            SizedBox(height: 16.0),
            TextFieldWithIcon(
              controller: cnpjController,
              icon: Icons.code,
              label: 'CNPJ',
            ),
            SizedBox(height: 16.0),
            TextFieldWithIcon(
              controller: cepController,
              icon: Icons.location_on,
              label: 'CEP',
            ),
            SizedBox(height: 16.0),
            TextFieldWithIcon(
              controller: enderecoController,
              icon: Icons.home,
              label: 'Endereço',
            ),
            SizedBox(height: 16.0),
            TextFieldWithIcon(
              controller: telefoneController,
              icon: Icons.phone,
              label: 'Telefone/Celular',
            ),
            SizedBox(height: 16.0),
            TextFieldWithIcon(
              controller: senhaController,
              icon: Icons.lock,
              label: 'Senha',
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            TextFieldWithIcon(
              controller: repetirSenhaController,
              icon: Icons.lock,
              label: 'Repetir senha',
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            TextFieldWithIcon(
              controller: numeroEnderecoController,
              icon: Icons.home_work,
              label: 'Número do endereço',
            ),
            SizedBox(height: 16.0),
            TextFieldWithIcon(
              controller: estadoController,
              icon: Icons.map,
              label: 'Estado',
            ),
            SizedBox(height: 16.0),
            TextFieldWithIcon(
              controller: cidadeController,
              icon: Icons.location_city,
              label: 'Cidade',
            ),
            SizedBox(height: 16.0),
            TextFieldWithIcon(
              controller: cargoController,
              icon: Icons.work,
              label: 'Cargo',
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: _finalizarCadastro,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 16.0),
                primary: Colors.blue, // Cor de fundo do botão
              ),
              child: Text(
                'Finalizar cadastro',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      )
    );
  }

  void _finalizarCadastro() {
    if (_formKey.currentState!.validate()) {
      // Futuramente implementar aqui a lógica para finalizar o cadastro
      // e salvar os dados inseridos nos campos.
    }
  }
}
