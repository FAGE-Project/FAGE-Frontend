import 'package:fage_telas/InicialSimulado.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:brasil_fields/brasil_fields.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PageController _pageController = PageController();
  final TextEditingController _cpf_cnpjControllerUser = TextEditingController();
  final TextEditingController _passwordControllerUser = TextEditingController();
  final TextEditingController _cpf_cnpjControllerCorp = TextEditingController();
  final TextEditingController _passwordControllerCorp = TextEditingController();
  var maskCPF = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});
  var maskCNPJ = MaskTextInputFormatter(
      mask: '##.###.###/####-##', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: PageView(
          controller: _pageController,
          children: [
            _buildUserLogin(),
            _buildCorporateLogin(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserLogin() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 600) {
              // For screens wider than 600px, show the login form in two columns
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/user.png',
                          width: 100,
                        ),
                        SizedBox(height: 20),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                inputFormatters: [maskCPF],
                                controller: _cpf_cnpjControllerUser,
                                keyboardType: TextInputType.number,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (CPFValidator.isValid(value)) {
                                    return null;
                                  } else {
                                    return 'CPF inválido';
                                  }
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
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Route rota = MaterialPageRoute(
                                  builder: (context) => InicialSimulado());
                              Navigator.push(context, rota);
                              //posteriormente adicionar caminho para tela inicial
                              //implementar um navigator push, dentro deste if para a tela que será criada futuramente.
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal: 20.0,
                            ),
                          ),
                          child: Text(
                            'Entrar',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
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
                          Buttons.Google,
                          onPressed: () {
                            // TODO: Login with Google
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          text: 'Entrar com Google',
                        ),
                        SizedBox(height: 10),
                        SignInButton(
                          Buttons.Facebook,
                          onPressed: () {
                            // TODO: Login with Facebook
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
                          child: Text('Login Corporativo'),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              // For screens narrower than 600px, show the login form in a single column
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/user.png',
                    width: 100,
                  ),
                  SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _cpf_cnpjControllerUser,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          inputFormatters: [maskCPF],
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (CPFValidator.isValid(value)) {
                              return null;
                            } else {
                              return 'CPF inválido';
                            }
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
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Route rota = MaterialPageRoute(
                            builder: (context) => InicialSimulado());
                        Navigator.push(context, rota);
                        // futuramente implementar a rota para a tela seguinte.
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 20.0,
                      ),
                    ),
                    child: Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      // TODO: Navigate to the forgot password screen
                    },
                    child: Text('Esqueci minha senha'),
                  ),
                  SizedBox(height: 20),
                  SignInButton(
                    Buttons.Google,
                    onPressed: () {
                      // TODO: Login with Google
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    text: 'Entrar com Google',
                  ),
                  SizedBox(height: 10),
                  SignInButton(
                    Buttons.Facebook,
                    onPressed: () {
                      // TODO: Login with Facebook
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
                    child: Text('Login Corporativo'),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildCorporateLogin() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 600) {
              // For screens wider than 600px, show the login form in two columns
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/corpe.png',
                          width: 100,
                        ),
                        SizedBox(height: 20),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _cpf_cnpjControllerCorp,
                                inputFormatters: [maskCNPJ],
                                keyboardType: TextInputType.number,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (CPFValidator.isValid(value)) {
                                    return null;
                                  } else if (CNPJValidator.isValid(value)) {
                                    return null;
                                  } else {
                                    return 'CPF ou CNPJ inválido';
                                  }
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
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Route rota = MaterialPageRoute(
                                  builder: (context) => InicialSimulado());
                              Navigator.push(context, rota);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal: 20.0,
                            ),
                          ),
                          child: Text(
                            'Entrar',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
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
                          Buttons.Google,
                          onPressed: () {
                            // TODO: Login with Google
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          text: 'Entrar com Google',
                        ),
                        SizedBox(height: 10),
                        SignInButton(
                          Buttons.Facebook,
                          onPressed: () {
                            // TODO: Login with Facebook
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
                          child: Text('Login de Usuário'),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              // For screens narrower than 600px, show the login form in a single column
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/corpe.png',
                    width: 100,
                  ),
                  SizedBox(height: 20),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _cpf_cnpjControllerCorp,
                          inputFormatters: [maskCNPJ],
                          keyboardType: TextInputType.number,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (CPFValidator.isValid(value)) {
                              return null;
                            } else if (CNPJValidator.isValid(value)) {
                              return null;
                            } else {
                              return 'CPF ou CNPJ inválido';
                            }
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
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Route rota = MaterialPageRoute(
                            builder: (context) => InicialSimulado());
                        Navigator.push(context, rota);
                        //posteriormente implementar rota para a tela inicial do corporativo
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 20.0,
                      ),
                    ),
                    child: Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      // TODO: Navigate to the forgot password screen
                    },
                    child: Text('Esqueci minha senha'),
                  ),
                  SizedBox(height: 20),
                  SignInButton(
                    Buttons.Google,
                    onPressed: () {
                      // TODO: Login with Google
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    text: 'Entrar com Google',
                  ),
                  SizedBox(height: 10),
                  SignInButton(
                    Buttons.Facebook,
                    onPressed: () {
                      // TODO: Login with Facebook
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
                    child: Text('Login de Usuário'),
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
