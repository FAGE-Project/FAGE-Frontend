import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nomeCompletoController = TextEditingController();
  final TextEditingController sobrenomeController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController cepController = TextEditingController();
  final TextEditingController enderecoController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController repetirSenhaController = TextEditingController();
  final TextEditingController estadoController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();

  var maskCPF = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});

  var maskCEP = MaskTextInputFormatter(
      mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset("assets/images/fage-logo-white.png", scale: 2),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: _buildUserRegister(),
        ));
  }

  Widget _buildUserRegister() {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Mostra o ícone de avatar com a função de seleção/foto/recorte

            _buildTextFieldWithIcon(
              controller: nomeCompletoController,
              icon: Icons.person,
              label: 'Nome Completo',
            ),
            SizedBox(height: 16.0),
            _buildTextFieldWithIcon(
              controller: emailController,
              icon: Icons.email,
              label: 'E-mail',
            ),
            SizedBox(height: 16.0),
            _buildTextFieldWithIcon(
              controller: cpfController,
              icon: Icons.code,
              label: 'CPF',
            ),
            SizedBox(height: 16.0),
            _buildTextFieldWithIcon(
              controller: cepController,
              icon: Icons.location_on,
              label: 'CEP',
            ),
            SizedBox(height: 16.0),
            _buildTextFieldWithIcon(
              controller: enderecoController,
              icon: Icons.home,
              label: 'Endereço',
            ),
            SizedBox(height: 16.0),
            _buildTextFieldWithIcon(
              controller: estadoController,
              icon: Icons.map,
              label: 'Estado',
            ),
            SizedBox(height: 16.0),
            _buildTextFieldWithIcon(
              controller: cidadeController,
              icon: Icons.location_city,
              label: 'Cidade',
            ),
            SizedBox(height: 16.0),
            _buildTextFieldWithIcon(
              controller: telefoneController,
              icon: Icons.phone,
              label: 'Telefone/Celular',
            ),
            SizedBox(height: 16.0),
            _buildTextFieldWithIcon(
              controller: senhaController,
              icon: Icons.lock,
              label: 'Senha',
              obscureText: true,
            ),
            SizedBox(height: 16.0),
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
              ),
              child: Text(
                'Finalizar cadastro',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldWithIcon({
    required TextEditingController controller,
    required IconData icon,
    required String label,
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

  void _finalizarCadastro() {
    if (_formKey.currentState!.validate()) {
      // Implementar aqui a lógica para finalizar o cadastro
      // e salvar os dados inseridos nos campos.
    }
  }
}
