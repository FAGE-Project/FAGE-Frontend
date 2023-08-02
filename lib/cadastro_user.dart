import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PageController _pageController = PageController();

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController sobrenomeController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController cepController = TextEditingController();
  final TextEditingController enderecoController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  var maskCPF = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});

  var maskCEP = MaskTextInputFormatter(
      mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "login",
      home: Scaffold(
          appBar: AppBar(
            title: Text('Cadastro Empresa'),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: _buildUserRegister(),
          )),
    );
  }

  Widget _buildUserRegister() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //colocar uma imagem depois,
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: nomeController,
                              decoration: InputDecoration(
                                  labelText: "Nome",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              controller: sobrenomeController,
                              decoration: InputDecoration(
                                  labelText: "Sobrenome",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              inputFormatters: [maskCPF],
                              controller: cpfController,
                              decoration: InputDecoration(
                                  labelText: "CPF",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              inputFormatters: [maskCEP],
                              controller: cepController,
                              decoration: InputDecoration(
                                  labelText: "CEP",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              controller: enderecoController,
                              decoration: InputDecoration(
                                  labelText: "Endereço",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              controller: telefoneController,
                              decoration: InputDecoration(
                                  labelText: "Telefone/Celular",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  labelText: "Email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              controller: senhaController,
                              decoration: InputDecoration(
                                  labelText: "Senha",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //colocar uma imagem depois,
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nomeController,
                        decoration: InputDecoration(
                            labelText: "Nome",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: sobrenomeController,
                        decoration: InputDecoration(
                            labelText: "Sobrenome",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        inputFormatters: [maskCPF],
                        controller: cpfController,
                        decoration: InputDecoration(
                            labelText: "CPF",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        inputFormatters: [maskCEP],
                        controller: cepController,
                        decoration: InputDecoration(
                            labelText: "CEP",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: enderecoController,
                        decoration: InputDecoration(
                            labelText: "Endereço",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: telefoneController,
                        decoration: InputDecoration(
                            labelText: "Telefone/Celular",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: senhaController,
                        decoration: InputDecoration(
                            labelText: "Senha",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
