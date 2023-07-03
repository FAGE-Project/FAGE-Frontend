import 'package:flutter/material.dart';

class CadastroCorp extends StatefulWidget {
  const CadastroCorp({Key? key}) : super(key: key);

  @override
  State<CadastroCorp> createState() => _CadastroCorpState();
}

class _CadastroCorpState extends State<CadastroCorp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "login",
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: PageView(
          controller: _pageController,
          children: [
            _buildUserRegister(),
          ],
        ),
      ),
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
                              decoration: InputDecoration(
                                  labelText: "E-mail",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Nome da Empresa",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: "CNPJ",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: "CEP",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Endereço",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Telefone/Celular",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Senha",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Repetir Senha",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Número do endereço",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Estado",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Cidade",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  )),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Cargo",
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
                        decoration: InputDecoration(
                            labelText: "E-mail",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Nome da Empresa",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "CNPJ",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "CEP",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Endereço",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Telefone/Celular",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Senha",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Repetir Senha",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Número do endereço",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Estado",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Cidade",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Cargo",
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
