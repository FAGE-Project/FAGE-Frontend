import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final TextEditingController enderecoController = TextEditingController();
  final TextEditingController cepController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController repetirSenhaController = TextEditingController();

  var maskCPF = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});

  var maskCEP = MaskTextInputFormatter(
      mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});

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
            padding: EdgeInsets.all(20.0),
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
                            _buildTextFieldWithIcon(
                              controller: nomeController,
                              icon: Icons.person,
                              label: 'Nome',
                            ),
                            const SizedBox(height: 20.0),
                            _buildTextFieldWithIcon(
                              controller: sobrenomeController,
                              icon: Icons.person,
                              label: 'Sobrenome',
                            ),
                            const SizedBox(height: 20.0),
                            _buildTextFieldWithIcon(
                              inputFormatters: [maskCPF],
                              keyboardType: TextInputType.number,
                              controller: cpfController,
                              icon: Icons.calendar_view_day,
                              label: 'CPF',
                            ),
                            const SizedBox(height: 20.0),
                            _buildTextFieldWithIcon(
                                controller: enderecoController,
                                icon: Icons.maps_home_work_rounded,
                                label: 'Endereço'),
                            const SizedBox(height: 20.0),
                            _buildTextFieldWithIcon(
                              inputFormatters: [maskCEP],
                              keyboardType: TextInputType.number,
                              controller: cepController,
                              icon: Icons.maps_home_work_rounded,
                              label: 'CEP',
                            ),
                            const SizedBox(height: 20.0),
                            _buildTextFieldWithIcon(
                              keyboardType: TextInputType.number,
                              controller: telefoneController,
                              icon: Icons.contact_phone_rounded,
                              label: 'Telefone/Celular',
                            ),
                            const SizedBox(height: 20.0),
                            _buildTextFieldWithIcon(
                              controller: emailController,
                              icon: Icons.email_rounded,
                              label: 'Email',
                            ),
                            const SizedBox(height: 20.0),
                            _buildTextFieldWithIcon(
                              controller: senhaController,
                              icon: Icons.password,
                              label: 'Senha',
                              obscureText: true,
                            ),
                            const SizedBox(height: 20.0),
                            _buildTextFieldWithIcon(
                              controller: repetirSenhaController, 
                              icon: Icons.lock, 
                              label: 'Repetir senha',
                              obscureText: true,
                            ),
                            SizedBox(height: 32.0),
                            ElevatedButton(
                              onPressed: _finalizarCadastro,
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                primary: Colors.blue,
                              ),
                              child: Text(
                                'Finalizar Cadastro',
                                style: TextStyle(fontSize: 18.0),
                              )
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
                      _buildTextFieldWithIcon(
                        controller: nomeController,
                        icon: Icons.person,
                        label: 'Nome',
                      ),
                      const SizedBox(height: 20.0),
                      _buildTextFieldWithIcon(
                        controller: sobrenomeController,
                        icon: Icons.person,
                        label: 'Sobrenome',
                      ),
                      const SizedBox(height: 20.0),
                      _buildTextFieldWithIcon(
                        inputFormatters: [maskCPF],
                        keyboardType: TextInputType.number,
                        controller: cpfController,
                        icon: Icons.calendar_view_day,
                        label: 'CPF',
                      ),
                      const SizedBox(height: 20.0),
                      _buildTextFieldWithIcon(
                        controller: enderecoController,
                        icon: Icons.maps_home_work_rounded,
                        label: 'Endereço',
                      ),
                      const SizedBox(height: 20.0),
                      _buildTextFieldWithIcon(
                        inputFormatters: [maskCEP],
                        keyboardType: TextInputType.number,
                        controller: cepController,
                        icon: Icons.maps_home_work_rounded,
                        label: 'CEP',
                      ),
                      const SizedBox(height: 20.0),
                      _buildTextFieldWithIcon(
                        keyboardType: TextInputType.number,
                        controller: telefoneController,
                        icon: Icons.contact_phone_rounded,
                        label: 'Telefone/Celular',
                      ),
                      const SizedBox(height: 20.0),
                      _buildTextFieldWithIcon(
                        controller: emailController,
                        icon: Icons.email_rounded,
                        label: 'Email',
                      ),
                      const SizedBox(height: 20.0),
                      _buildTextFieldWithIcon(
                        controller: senhaController,
                        icon: Icons.lock,
                        label: 'Senha',
                        obscureText: true,
                      ),
                      const SizedBox(height: 20.0),
                      _buildTextFieldWithIcon(
                        controller: repetirSenhaController,
                        icon: Icons.lock,
                        label: 'Repetir Senha',
                        obscureText: true,
                      ),
                      SizedBox(height: 32.0),
                      ElevatedButton(
                        onPressed: _finalizarCadastro,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          primary: Colors.blue,
                        ),
                        child: Text(
                          'Finalizar Cadastro',
                          style: TextStyle(fontSize: 18.0),
                        )
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

  Widget _buildTextFieldWithIcon({
    required TextEditingController controller,
    required IconData icon,
    required String label,
    inputFormatters,
    keyboardType,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon: Icon(icon),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Campo obrigatório';
        }
        return null;
      },
    );
  }
  
  void _finalizarCadastro(){
    if (_formKey.currentState!.validate()) {
      // Futuramente implementar aqui a lógica para finalizar o cadastro
      // e salvar os dados inseridos nos campos.
    }
  }

}
