import 'package:fage_telas/components/TextFieldWithIcon.dart';
import 'package:fage_telas/util/Util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UserEdit extends StatefulWidget {
  const UserEdit({super.key});

  @override
  State<UserEdit> createState() => _UserEditState();
}
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


class _UserEditState extends State<UserEdit> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "login",
      home: Scaffold(
          appBar: AppBar(
            title: Text('Editar Cadastro (Usuário)'),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: _buildUserEdit(),
          )),
    );
  }

  Widget _buildUserEdit(){
    return Center(
      child: Form(
        key: _formKey,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                TextFieldWithIcon(
                  controller: nomeController, 
                  icon: Icons.person, 
                  label: 'Nome',
                ),
                const SizedBox(height: 20.0),
                TextFieldWithIcon(
                  controller: sobrenomeController,
                  icon: Icons.person,
                  label: 'Sobrenome',
                ),
                const SizedBox(height: 20.0),
                TextFieldWithIcon(
                  inputFormatters: [Util.maskCPF],
                  keyboardType: TextInputType.number,
                  controller: cpfController,
                  icon: Icons.calendar_view_day,
                  label: 'CPF',
                ),
                const SizedBox(height: 20.0),
                TextFieldWithIcon(
                  controller: enderecoController,
                  icon: Icons.maps_home_work_rounded,
                  label: 'Endereço',
                ),
                const SizedBox(height: 20.0),
                TextFieldWithIcon(
                  inputFormatters: [Util.maskCEP],
                  keyboardType: TextInputType.number,
                  controller: cepController,
                  icon: Icons.maps_home_work_rounded,
                  label: 'CEP',
                ),
                const SizedBox(height: 20.0),
                TextFieldWithIcon(
                  inputFormatters: [Util.maskTelefone],
                  keyboardType: TextInputType.number,
                  controller: telefoneController,
                  icon: Icons.contact_phone_rounded,
                  label: 'Telefone/Celular',
                ),
                const SizedBox(height: 20.0),
                TextFieldWithIcon(
                  controller: emailController,
                  icon: Icons.email_rounded,
                  label: 'Email',
                ),
                const SizedBox(height: 20.0),
                TextFieldWithIcon(
                  controller: senhaController,
                  icon: Icons.lock,
                  label: 'Senha',
                  obscureText: true,
                ),
                const SizedBox(height: 20.0),
                TextFieldWithIcon(
                  controller: repetirSenhaController,
                  icon: Icons.lock,
                  label: 'Repetir Senha',
                  obscureText: true,
                ),
                SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: _finalizarEdicao,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                  child: Text(
                    'Finalizar Edição',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            );
        }),
      ),
    );
  }


  void _finalizarEdicao(){
    if (_formKey.currentState!.validate()) {
      // Futuramente implementar aqui a lógica para finalizar o cadastro
      // e salvar os dados inseridos nos campos.
    }
  }

}