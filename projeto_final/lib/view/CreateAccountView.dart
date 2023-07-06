import 'package:flutter/material.dart';
import '../model/DB.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  bool _obscureTextPassword = true;
  double _letterSpacingPassword = 10;
  bool _obscureTextPasswordConfirm = true;
  double _letterSpacingPasswordConfirm = 10;
  int usuarioId = 0;
  List usuarios = [];
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();
  final TextEditingController _controllerLatitude = TextEditingController();
  final TextEditingController _controllerLongitude = TextEditingController();
  final TextEditingController _controllerConfirmarSenha =
      TextEditingController();
  dynamic _colorBorder = Colors.red;
  dynamic _createAccountPermission = false;
  dynamic _colorButton = Colors.green[200];

  void _CreateAccount() async {
    if (_createAccountPermission == true &&
        _controllerEmail.text != '' &&
        _controllerLatitude.text != '' &&
        _controllerLongitude.text != '') {
      print(_controllerLatitude.text);
      print(_controllerLongitude.text);
      double? latitude = double.tryParse(_controllerLatitude.text);
      double? longitude = double.tryParse(_controllerLongitude.text);

      await inserirUsuario(
        _controllerEmail.text,
        _controllerSenha.text,
        latitude,
        longitude,
      );

      print(await pegarUsuario(_controllerEmail.text));

      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    } else {
      print('erroo');
    }
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
                    'Latitude:',
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
                  keyboardType: TextInputType.number,
                  controller: _controllerLatitude,
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
                    'Longitude:',
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
                  keyboardType: TextInputType.number,
                  controller: _controllerLongitude,
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
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Confirmar senha:',
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
                  obscureText: _obscureTextPasswordConfirm,
                  controller: _controllerConfirmarSenha,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    letterSpacing: _letterSpacingPasswordConfirm,
                  ),
                  cursorColor: Colors.black,
                  onChanged: (password) {
                    setState(() {
                      if (_controllerSenha.text == password &&
                          _controllerSenha.text != '') {
                        _colorBorder = Colors.black;
                        _createAccountPermission = true;
                        _colorButton = Colors.green;
                      } else {
                        _colorBorder = Colors.red;
                        _colorButton = Colors.green[200];
                      }
                    });
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (_obscureTextPasswordConfirm == true) {
                          setState(() {
                            _obscureTextPasswordConfirm = false;
                            _letterSpacingPasswordConfirm = 0;
                          });
                        } else {
                          setState(() {
                            _obscureTextPasswordConfirm = true;
                            _letterSpacingPasswordConfirm = 10;
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
                        color: _colorBorder,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                      borderSide: BorderSide(
                        color: _colorBorder,
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
                      _CreateAccount();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(_colorButton),
                    ),
                    child: Text(
                      'Criar Conta',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
