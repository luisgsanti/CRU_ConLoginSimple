import 'package:examen_1/inicio.dart';
import 'package:examen_1/modelos.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: login(),
    );
  }
}

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  late TextEditingController controladorUsuario;
  late TextEditingController controladorClave;

  @override
  void initState() {
    super.initState();
    controladorUsuario = TextEditingController();
    controladorClave = TextEditingController();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Flexible(child: Image.asset('image/login.png')),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: TextField(
            controller: controladorUsuario,
            decoration: InputDecoration(
                icon: Icon(Icons.email),
                filled: true,
                labelText: 'Usuario',
                suffix: GestureDetector(
                  child: Icon(Icons.close),
                  onTap: () {
                    controladorUsuario.clear();
                  },
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: TextField(
            controller: controladorClave,
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.password),
                filled: true,
                labelText: 'Clave',
                suffix: GestureDetector(
                  child: Icon(Icons.close),
                  onTap: () {
                    controladorClave.clear();
                  },
                )),
          ),
        ),
        MaterialButton(
          minWidth: 200.0,
          height: 60.0,
          onPressed: () {
            if (controladorUsuario.text.isNotEmpty &&
                controladorClave.text.isNotEmpty) {
              if (controladorUsuario.text == logins[0].usuario.toString()) {
                if (controladorClave.text == logins[0].clave.toString()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => inicio(),
                      ));
                } else {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            content: Text('Usuario o clave incorrectos'),
                          ));
                }
              } else {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          content: Text('Usuario o clave incorrectos'),
                        ));
              }
            } else {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        content: Text('No se aceptan campos vacios'),
                      ));
            }
          },
          color: Colors.lightBlue,
          child: Text('Iniciar Sesion',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ]),
    );
  }
}
