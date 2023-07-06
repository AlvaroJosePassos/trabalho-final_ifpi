import 'package:flutter/material.dart';
import 'package:projeto_final/model/DB.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _obscureTextPassword = true;
  double _letterSpacingPassword = 10;
  int usuarioId = 0;
  List usuarios = [];
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();
  late String email;
  late String senha;

  _verificaLogin() {

      Navigator.pushNamedAndRemoveUntil(context, '/HomeView', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(50, 20, 50, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset(
                  'assets/images/ifpi_logo.png',
                  scale: 1.5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email ou Usuário:',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  controller: _controllerEmail,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsetsGeometry.lerp(EdgeInsets.all(0),
                        EdgeInsets.fromLTRB(10, 0, 10, -20), 1),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Senha:',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: _obscureTextPassword,
                  controller: _controllerSenha,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    letterSpacing: _letterSpacingPassword,
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (_obscureTextPassword == true) {
                          setState(() {
                            _obscureTextPassword = false;
                            _letterSpacingPassword = 0;
                          });
                        } else {
                          setState(() {
                            _obscureTextPassword = true;
                            _letterSpacingPassword = 10;
                          });
                        }
                      },
                      icon: Icon(Icons.remove_red_eye_outlined),
                    ),
                    contentPadding: EdgeInsetsGeometry.lerp(EdgeInsets.all(1),
                        EdgeInsets.fromLTRB(10, 0, 0, -20), 1),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Container(
                  height: 45.0,
                  child: ElevatedButton(
                    onPressed: () {
                      _verificaLogin();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green),
                    ),
                    child: Text(
                      'Entrar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Não tem uma conta?',
                      textAlign: TextAlign.center,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/CreateAccountView');
                      },
                      child: Text(
                        'Crie aqui',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.green,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
