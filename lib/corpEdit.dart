import 'package:flutter/material.dart';

class corpEdit extends StatefulWidget {
  const corpEdit({Key? key}) : super(key: key);

  @override
  State<corpEdit> createState() => _corpEditState();
}

class _corpEditState extends State<corpEdit> {
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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Edição Empresa'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: _buildcorpEdit(),
        ),
      ),
    );
  }

  Widget _buildcorpEdit() {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextFieldWithIcon(
              controller: emailController,
              icon: Icons.email,
              label: 'E-mail',
            ),
            SizedBox(height: 16.0),
            _buildTextFieldWithIcon(
              controller: empresaController,
              icon: Icons.business,
              label: 'Nome da Empresa',
            ),
            SizedBox(height: 16.0),
            _buildTextFieldWithIcon(
              controller: cnpjController,
              icon: Icons.code,
              label: 'CNPJ',
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
              controller: numeroEnderecoController,
              icon: Icons.home_work,
              label: 'Número do endereço',
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
                'Finalizar edição',
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
    }
  }
}