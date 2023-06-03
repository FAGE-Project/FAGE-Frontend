import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PageController _pageController = PageController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                                controller: _emailController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: validarEmail,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                controller: _passwordController,
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
                            if(_formKey.currentState!.validate()){
                              return null; //posteriormente adicionar caminho para tela inicial
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
                          controller: _emailController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: validarSenha,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordController,
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
                      if(_formKey.currentState!.validate()){
                        return null;
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
  bool emailValido = false;

  String? validarEmail(String? value){
    final emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    if(value == null || value.isEmpty){
      return 'Por favor, insira um email válido';
    }else if(!RegExp(emailRegex).hasMatch(value)) {
      return 'Por favor insira um email válido';
    }
    else{
      return null; // retorna null se email for válido
    }
  }

  String? validarSenha(String? value){
    final senhaRegex = r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*&])[A-Za-z\d@$!%*?&]+$';
    if(value == null || value.isEmpty){
      return 'Por favor, insira uma senha';
    }else if(value.length < 8){
      return 'A senha deve ter no mínimo 8 caracteres';
    }else{
      return null; // retorna null se senha for válida
    }
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
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email corporativo',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            // TODO: Login the user
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
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email corporativo',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Login the user
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
}
