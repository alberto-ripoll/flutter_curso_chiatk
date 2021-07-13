import 'package:app_modulo1/src/connection/server_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modulo1_fake_backend/user.dart';

class LoginPage extends StatefulWidget {
  ServerController serverController;
  BuildContext context;
  LoginPage(this.serverController, this.context, {Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _loading = false;
  String nickname = "";
  String password = '';

  String errMsg = '';
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 60),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.cyan.shade300, Colors.cyan.shade800])),
            child: Image.asset(
              "assets/images/logo.png",
              color: Colors.white,
              height: 200,
            ),
          ),
          Transform.translate(
            offset: Offset(0, -40),
            child: Center(
              child: SingleChildScrollView(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.only(
                      left: 20, right: 20, top: 260, bottom: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 35,
                      vertical: 20,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: "Usuario:"),
                          onSaved: (value) {
                            nickname = value!;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Este campo es obligatorio";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 40),
                        TextFormField(
                          decoration: InputDecoration(labelText: "Contraseña:"),
                          obscureText: true,
                          onSaved: (value) {
                            password = value!;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Este campo es obligatorio";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 40),
                        ElevatedButton(
                            onPressed: () {
                              _login(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (!_loading) Text('Iniciar Sesion'),
                                if (_loading)
                                  Container(
                                    height: 20,
                                    width: 20,
                                    margin: EdgeInsets.only(left: 20),
                                    child: CircularProgressIndicator(),
                                  )
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15))),
                        if (errMsg.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              errMsg,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('¿No estás registrado?'),
                            TextButton(
                                onPressed: () {
                                  _showRegister();
                                },
                                child: Text('Registrarse'))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  _showRegister() {
    Navigator.of(context).pushNamed('/register');
  }

  void _login(BuildContext context) async {
    if (!_loading) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        setState(() {
          _loading = true;
          errMsg = "";
        });
        User user = await widget.serverController.login(nickname, password);
        if (user != null) {
          Navigator.of(context).pushReplacementNamed('/home', arguments: user);
        } else {
          setState(() {
            errMsg = "Usuario o contraseña incorrectos";
            _loading = false;
          });
        }
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.serverController.init(widget.context);
  }
}
