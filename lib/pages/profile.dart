import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sign_in_button/sign_in_button.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PageController _pageController = PageController();
  final TextEditingController _cpf_cnpjControllerUser = TextEditingController();
  final TextEditingController _passwordControllerUser = TextEditingController();
  final TextEditingController _cpf_cnpjControllerCorp = TextEditingController();
  final TextEditingController _passwordControllerCorp = TextEditingController();

  Future<void> _authenticateUser() async {
    Map<String, dynamic> userData = {
      'email': _cpf_cnpjControllerUser.text,
      'senha': _passwordControllerUser.text
    };

    final response = await http.post(
      Uri.parse('https://3f28-170-0-145-85.sa.ngrok.io/pessoa/auth'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(userData),
    );

    if (response.statusCode == 200) {
      print("Profile bem-sucedido");
    } else {
      print("Profile mal-sucedido");
    }
  }

  Future<void> _authenticateCorp() async {
    Map<String, dynamic> userData = {
      'email': _cpf_cnpjControllerCorp.text,
      'senha': _passwordControllerCorp.text
    };

    final response = await http.post(
      Uri.parse('https://3f28-170-0-145-85.sa.ngrok.io/pessoa/auth'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(userData),
    );

    if (response.statusCode == 200) {
      print("Profile bem-sucedido");
    } else {
      print("Profile mal-sucedido");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 600) {
              // For screens wider than 600px, show the Profile form in two columns
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _cpf_cnpjControllerUser,
                          keyboardType: TextInputType.number,
                          autovalidateMode:
                          AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            // if (CPFValidator.isValid(value)) {
                            //   return null;
                            // } else {
                            //   return 'CPF inválido';
                            // }
                          },
                          decoration: InputDecoration(
                            labelText: 'CPF',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _passwordControllerUser,
                          autovalidateMode:
                          AutovalidateMode.onUserInteraction,
                          validator: validarSenha,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // TODO: Navigate to the forgot password screen
                          },
                          child: Text('Esqueci minha senha'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SignInButton(
                          Buttons.google,
                          onPressed: () {
                            // TODO: Profile with Google
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          text: 'Entrar com Google',
                        ),
                        SizedBox(height: 10),
                        SignInButton(
                          Buttons.facebook,
                          onPressed: () {
                            // TODO: Profile with Facebook
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          text: 'Entrar com Facebook',
                        ),
                        SizedBox(height: 20),
                        TextButton.icon(
                          onPressed: () {
                            // TODO: Navigate to the email registration screen
                          },
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                color: Colors.blue,
                                width: 2.0,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal: 20.0,
                            ),
                          ),
                          icon: Icon(
                            Icons.email,
                            color: Colors.blue,
                          ),
                          label: Text(
                            'Cadastrar pelo Email',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            _pageController.animateToPage(
                              1,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: const Text("Perfil Corporativo"),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              // For screens narrower than 600px, show the Profile form in a single column
              return Column(
                children: [
                  SizedBox(height: 60),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _cpf_cnpjControllerUser,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            // if (CPFValidator.isValid(value)) {
                            //   return null;
                            // } else {
                            //   return 'CPF inválido';
                            // }
                          },
                          decoration: InputDecoration(
                            labelText: 'CPF',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordControllerUser,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: validarSenha,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Navigate to the forgot password screen
                    },
                    child: Text('Esqueci minha senha'),
                  ),
                  SizedBox(height: 20),
                  SignInButton(
                    Buttons.google,
                    onPressed: () {
                      // TODO: Profile with Google
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    text: 'Entrar com Google',
                  ),
                  SizedBox(height: 10),
                  SignInButton(
                    Buttons.facebook,
                    onPressed: () {
                      // TODO: Profile with Facebook
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    text: 'Entrar com Facebook',
                  ),
                  SizedBox(height: 20),
                  TextButton.icon(
                    onPressed: () {
                      // TODO: Navigate to the email registration screen
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 20.0,
                      ),
                    ),
                    icon: Icon(
                      Icons.email,
                      color: Colors.blue,
                    ),
                    label: Text(
                      'Cadastrar pelo Email',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildCorporateProfile() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 600) {
              // For screens wider than 600px, show the Profile form in two columns
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _cpf_cnpjControllerCorp,
                                keyboardType: TextInputType.number,
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  // if (CPFValidator.isValid(value)) {
                                  //   return null;
                                  // } else if (CNPJValidator.isValid(value)) {
                                  //   return null;
                                  // } else {
                                  //   return 'CPF ou CNPJ inválido';
                                  // }
                                },
                                decoration: InputDecoration(
                                  labelText: 'CPF/CNPJ',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                controller: _passwordControllerCorp,
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                validator: validarSenha,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Senha',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        // ElevatedButton(
                        //   onPressed: () async {
                        //     if (_formKey.currentState!.validate()) {
                        //       await _authenticateCorp();
                        //       Route rota = MaterialPageRoute(
                        //           builder: (context) => InicialSimulado());
                        //       Navigator.push(context, rota);
                        //     }
                        //   },
                        //   style: ElevatedButton.styleFrom(
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(20.0),
                        //     ),
                        //     padding: EdgeInsets.symmetric(
                        //       vertical: 12.0,
                        //       horizontal: 20.0,
                        //     ),
                        //   ),
                        //   child: Text(
                        //     'Entrar',
                        //     style: TextStyle(
                        //       fontSize: 16.0,
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            // TODO: Navigate to the forgot password screen
                          },
                          child: Text('Esqueci minha senha'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SignInButton(
                          Buttons.google,
                          onPressed: () {
                            // TODO: Profile with Google
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          text: 'Entrar com Google',
                        ),
                        SizedBox(height: 10),
                        SignInButton(
                          Buttons.facebook,
                          onPressed: () {
                            // TODO: Profile with Facebook
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          text: 'Entrar com Facebook',
                        ),
                        SizedBox(height: 20),
                        TextButton.icon(
                          onPressed: () {
                            // TODO: Navigate to the email registration screen
                          },
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                color: Colors.blue,
                                width: 2.0,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal: 20.0,
                            ),
                          ),
                          icon: Icon(
                            Icons.email,
                            color: Colors.blue,
                          ),
                          label: Text(
                            'Cadastrar pelo Email',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            _pageController.animateToPage(
                              0,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: Text('Perfil de Usuário'),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              // For screens narrower than 600px, show the Profile form in a single column
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _cpf_cnpjControllerCorp,
                          keyboardType: TextInputType.number,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            // if (CPFValidator.isValid(value)) {
                            //   return null;
                            // } else if (CNPJValidator.isValid(value)) {
                            //   return null;
                            // } else {
                            //   return 'CPF ou CNPJ inválido';
                            // }
                          },
                          decoration: InputDecoration(
                            labelText: 'CPF/CNPJ',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordControllerCorp,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: validarSenha,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // ElevatedButton(
                  //   onPressed: () async {
                  //     if (_formKey.currentState!.validate()) {
                  //       await _authenticateCorp();
                  //       Route rota = MaterialPageRoute(
                  //           builder: (context) => InicialSimulado());
                  //       Navigator.push(context, rota);
                  //       //posteriormente implementar rota para a tela inicial do corporativo
                  //     }
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(20.0),
                  //     ),
                  //     padding: EdgeInsets.symmetric(
                  //       vertical: 12.0,
                  //       horizontal: 20.0,
                  //     ),
                  //   ),
                  //   child: Text(
                  //     'Entrar',
                  //     style: TextStyle(
                  //       fontSize: 16.0,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      // TODO: Navigate to the forgot password screen
                    },
                    child: Text('Esqueci minha senha'),
                  ),
                  SizedBox(height: 20),
                  SignInButton(
                    Buttons.google,
                    onPressed: () {
                      // TODO: Profile with Google
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    text: 'Entrar com Google',
                  ),
                  SizedBox(height: 10),
                  SignInButton(
                    Buttons.facebook,
                    onPressed: () {
                      // TODO: Profile with Facebook
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    text: 'Entrar com Facebook',
                  ),
                  SizedBox(height: 20),
                  TextButton.icon(
                    onPressed: () {
                      // TODO: Navigate to the email registration screen
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 20.0,
                      ),
                    ),
                    icon: Icon(
                      Icons.email,
                      color: Colors.blue,
                    ),
                    label: Text(
                      'Cadastrar pelo Email',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      _pageController.animateToPage(
                        0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    child: Text('Perfil de Usuário'),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  String? validarSenha(String? value) {
    final senhaRegex =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*&])[A-Za-z\d@$!%*?&]+$';
    if (value == null || value.isEmpty) {
      return 'Por favor, insira uma senha';
    } else if (value.length < 8) {
      return 'A senha deve ter no mínimo 8 caracteres';
    } else {
      return null; // retorna null se senha for válida
    }
  }
}
