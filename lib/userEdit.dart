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

var maskCPF = MaskTextInputFormatter(
  mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});

var maskCEP = MaskTextInputFormatter(
  mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});


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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
            if(constraints.maxWidth > 600){
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFieldWithIcon(
                                controller: nomeController, 
                                icon: Icons.person, 
                                label: 'Nome',
                              ),
                              const SizedBox(height: 20),
                              TextFieldWithIcon(
                                controller: sobrenomeController, 
                                icon: Icons.person, 
                                label: 'Sobrenome',
                              ),
                              const SizedBox(height: 20),
                              TextFieldWithIcon(
                                inputFormatters: [maskCPF],
                                keyboardType: TextInputType.number,
                                controller: cpfController, 
                                icon: Icons.calendar_view_day, 
                                label: 'CPF',
                              ),
                              const SizedBox(height: 20),
                              TextFieldWithIcon(
                                controller: enderecoController, 
                                icon: Icons.maps_home_work_rounded,
                                label: 'Endereço',
                              ),
                              const SizedBox(height: 20),
                              TextFieldWithIcon(
                                inputFormatters: [maskCEP],
                                keyboardType: TextInputType.number,
                                controller: cepController, 
                                icon: Icons.maps_home_work_rounded, 
                                label: 'CEP',
                              ),
                              const SizedBox(height: 20),
                              TextFieldWithIcon(
                                keyboardType: TextInputType.number,
                                controller: telefoneController, 
                                icon: Icons.contact_phone_rounded, 
                                label: 'Telefone/Celular',
                              ),
                              const SizedBox(height: 20),
                              TextFieldWithIcon(
                                controller: emailController, 
                                icon: Icons.email, 
                                label: 'Email',
                              ),
                              const SizedBox(height: 20),
                              TextFieldWithIcon(
                                controller: senhaController, 
                                icon: Icons.lock, 
                                label: 'Senha',
                              ),
                              const SizedBox(height: 20),
                              TextFieldWithIcon(
                                controller: repetirSenhaController, 
                                icon: Icons.lock, 
                                label: 'Repetir Senha',
                              ),
                              SizedBox(height: 32.0),
                              ElevatedButton(
                                onPressed: _finalizarEdicao,
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
                        )
                      ],
                    ),
                  )
                ],
              );
            }else{
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFieldWithIcon(
                          controller: nomeController,
                          icon: Icons.person, 
                          label: 'Nome'
                        ),
                        const SizedBox(height: 20),
                        TextFieldWithIcon(
                          controller: sobrenomeController, 
                          icon: Icons.person, 
                          label: 'Sobrenome'
                        ),
                        const SizedBox(height: 20),
                        TextFieldWithIcon(
                          inputFormatters: [maskCPF],
                          keyboardType: TextInputType.number,
                          controller: cpfController, 
                          icon: Icons.calendar_view_day, 
                          label: 'CPF'
                        ),
                        const SizedBox(height: 20),
                        TextFieldWithIcon(
                          controller: enderecoController, 
                          icon: Icons.maps_home_work_rounded, 
                          label: 'Endereço'
                        ),
                        const SizedBox(height: 20),
                        TextFieldWithIcon(
                          inputFormatters: [maskCEP],
                          keyboardType: TextInputType.number,
                          controller: cepController,
                          icon: Icons.maps_home_work_rounded, 
                          label: 'CEP'
                        ),
                        const SizedBox(height: 20),
                        TextFieldWithIcon(
                          keyboardType: TextInputType.number,
                          controller: telefoneController, 
                          icon: Icons.contact_phone_rounded, 
                          label: 'Telefone/Celular',
                        ),
                        const SizedBox(height: 20),
                        TextFieldWithIcon(
                          controller: emailController, 
                          icon: Icons.mail, 
                          label: 'Email',
                        ),
                        const SizedBox(height: 20),
                        TextFieldWithIcon(
                          controller: senhaController, 
                          icon: Icons.lock, 
                          label: 'Senha',
                        ),
                        const SizedBox(height: 20),
                        TextFieldWithIcon(
                          controller: repetirSenhaController, 
                          icon: Icons.lock, 
                          label: 'Repetir senha',
                        ),
                        SizedBox(height: 32.0),
                        ElevatedButton(
                          onPressed: _finalizarEdicao,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            primary: Colors.blue,
                          ),
                          child: Text(
                            'Finalizar Edição',
                            style: TextStyle(fontSize: 18.0),
                          )
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
          }
        ),
      ),
    );
  }

  Widget TextFieldWithIcon({
    required TextEditingController controller,
    required IconData icon,
    required String label,
    keyboardType,
    inputFormatters,
    obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        prefixIcon: Icon(icon),
        
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Campo obrigatório';
        }
        return null;
      },
    );
  }

  void _finalizarEdicao(){
    if (_formKey.currentState!.validate()) {
      // Futuramente implementar aqui a lógica para finalizar o cadastro
      // e salvar os dados inseridos nos campos.
    }
  }

}