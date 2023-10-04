import 'package:fage/components/custom_text_form_field.dart';
import 'package:fage/controller/usuario_controller.dart';
import 'package:fage/dto/usuario_dto.dart';
import 'package:fage/util/util.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final documentController = TextEditingController();
  var maskFormatter = new MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  void _next() async {
    if (_formKey.currentState!.validate()) {
      var usuarioDTO = UsuarioDTO(
          nome: nameController.value.text,
          senha: passwordController.value.text,
          email: emailController.value.text,
          documento: documentController.value.text);
      var response = await UsuarioController.cadastrarUsuario(usuarioDTO);
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      if (response.status == 201) {
        const snackBar = SnackBar(
          content: Text("Usuário cadastrado com sucesso!"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pop(context);
      } else {
        var snackBar = SnackBar(
          content: Text(response.message),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Image.asset("assets/images/fage-logo-white.png", scale: 2),
          centerTitle: true,
        ),
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                Spacer(),
                Flexible(
                    flex: 2,
                    child: CustomTextFormField(
                        controller: nameController,
                        labelText: "Nome completo",
                        prefixIcon: Icon(Icons.edit),
                        validator: (value) => value == null || value.isEmpty
                            ? "Campo obrigatório"
                            : null)),
                Spacer(),
                Flexible(
                    flex: 2,
                    child: CustomTextFormField(
                        inputFormatters: [maskFormatter],
                        controller: documentController,
                        labelText: "Documento",
                        keyboardType: TextInputType.number,
                        prefixIcon: Icon(Icons.description),
                        validator: (value) => value == null || value.isEmpty
                            ? "Campo obrigatório"
                            : null)),
                Spacer(),
                Flexible(
                    flex: 2,
                    child: CustomTextFormField(
                        controller: emailController,
                        labelText: "E-mail",
                        prefixIcon: Icon(Icons.email),
                        validator: (value) {
                          var regExp = RegExp(Util.emailRegex);
                          if (value == null || value.isEmpty) {
                            return "Campo obrigatório";
                          }
                          if (!regExp.hasMatch(value)) {
                            return "Informe um e-mail válido";
                          }
                          return null;
                        })),
                Spacer(),
                Flexible(
                    flex: 2,
                    child: CustomTextFormField(
                      controller: passwordController,
                      labelText: "Senha",
                      prefixIcon: Icon(Icons.visibility),
                      validator: (value) => value == null || value.isEmpty
                          ? "Campo obrigatório"
                          : value.length < 6
                              ? "A senha deve conter no mínimo 6 caracteres"
                              : null,
                    )),
                Spacer(),
                Flexible(
                    child: FilledButton(
                  child: Text("Cadastrar"),
                  onPressed: () => _next(),
                )),
              ],
            )));
  }
}
