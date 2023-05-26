import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class CorporateLogin extends StatefulWidget {
  const CorporateLogin({Key? key}) : super(key: key);

  @override
  State<CorporateLogin> createState() => _CorporateLoginState();
}

class _CorporateLoginState extends State<CorporateLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corporate Login',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/user.png',
                  width: 100,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Corporate Email',
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
                    labelText: 'Corporate Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Login the corporate user
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
                    'Corporate Login',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Navigate to the forgot password screen
                  },
                  child: Text('Forgot Password'),
                ),
                SizedBox(height: 20),
                SignInButton(
                  Buttons.Google,
                  onPressed: () {
                    // TODO: Login with Google for corporate users
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  text: 'Corporate Login with Google',
                ),
                SignInButton(
                  Buttons.Facebook,
                  onPressed: () {
                    // TODO: Login with Facebook for corporate users
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  text: 'Corporate Login with Facebook',
                ),
                SizedBox(height: 20),
                TextButton.icon(
                  onPressed: () {
                    // TODO: Navigate to the corporate email registration screen
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
                    'Corporate Register with Email',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
