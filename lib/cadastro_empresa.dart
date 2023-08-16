import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Importando o pacote para tirar fotos e escolher imagens
import 'package:image_cropper/image_cropper.dart'; // Importando o pacote para recortar imagens

class CadastroCorp extends StatefulWidget {
  const CadastroCorp({Key? key}) : super(key: key);

  @override
  State<CadastroCorp> createState() => _CadastroCorpState();
}

class _CadastroCorpState extends State<CadastroCorp> {
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
  final TextEditingController numeroEnderecoController =
      TextEditingController();
  final TextEditingController estadoController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();
  final TextEditingController cargoController = TextEditingController();

  // Variável para armazenar a imagem do avatar
  late ImageProvider _avatarImage = AssetImage('assets/images/corp.png');

  // Função para selecionar ou tirar uma foto e fazer o recorte (crop)
  Future<void> _pickAndCropImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final croppedImage = await ImageCropper().cropImage(
        sourcePath: pickedImage.path,
        aspectRatioPresets: [CropAspectRatioPreset.square],
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Recortar Imagem',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true,
          ),
          IOSUiSettings(
            title: 'Recortar Imagem',
          ),
        ],
      );
      if (croppedImage != null) {
        setState(() {
          _avatarImage = FileImage(croppedImage as File); // Atualiza a imagem do avatar
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cadastro Empresa'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: _buildCorpRegister(),
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return GestureDetector(
      onTap:
          _pickAndCropImage, // Chama a função para selecionar/tirar foto e recortar
      child: CircleAvatar(
        radius: 50,
        backgroundImage: _avatarImage,
        child: Icon(
          Icons.camera_alt,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildCorpRegister() {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildAvatar(),
            // Mostra o ícone de avatar com a função de seleção/foto/recorte
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
              controller: repetirSenhaController,
              icon: Icons.lock,
              label: 'Repetir senha',
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
