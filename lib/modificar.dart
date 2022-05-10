import 'package:examen_1/modelos.dart';
import 'package:flutter/material.dart';

class modificar extends StatefulWidget {
  final Persona persona;

  modificar(this.persona, {Key? key}) : super(key: key);

  @override
  State<modificar> createState() => _modificarState();
}

class _modificarState extends State<modificar> {
  Persona persona = new Persona();

  late TextEditingController controladorFoto;
  late TextEditingController controladorNombre;
  late TextEditingController controladorApellido;
  late TextEditingController controladorProfesion;
  late TextEditingController controladorFechaNacimiento;

  @override
  void initState() {
    Persona e = widget.persona;

    controladorFoto = TextEditingController(text: e.foto);
    controladorNombre = TextEditingController(text: e.nombre);
    controladorApellido = TextEditingController(text: e.apellido);
    controladorProfesion = TextEditingController(text: e.profesion);
    controladorFechaNacimiento = TextEditingController(text: e.fechaNacimiento);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List _login = logins;
    return Scaffold(
      appBar: AppBar(title: Text(' Modificar Persona '), actions: [
        Center(
          child: Text(
            _login[0].nombre,
          ),
        )
      ]),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.all(15.0),
          child: TextField(
            controller: controladorFoto,
            decoration: InputDecoration(
                filled: true,
                labelText: 'Foto (PNG)',
                suffix: GestureDetector(
                  child: Icon(Icons.close),
                  onTap: () {
                    controladorFoto.clear();
                  },
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: TextField(
            controller: controladorNombre,
            decoration: InputDecoration(
                filled: true,
                labelText: 'Nombre',
                suffix: GestureDetector(
                  child: Icon(Icons.close),
                  onTap: () {
                    controladorNombre.clear();
                  },
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: TextField(
            controller: controladorApellido,
            decoration: InputDecoration(
                filled: true,
                labelText: 'Apellido',
                suffix: GestureDetector(
                  child: Icon(Icons.close),
                  onTap: () {
                    controladorApellido.clear();
                  },
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: TextField(
            controller: controladorProfesion,
            decoration: InputDecoration(
                filled: true,
                labelText: 'Profesion',
                suffix: GestureDetector(
                  child: Icon(Icons.close),
                  onTap: () {
                    controladorProfesion.clear();
                  },
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: TextField(
            controller: controladorFechaNacimiento,
            decoration: InputDecoration(
                filled: true,
                labelText: 'Fecha de nacimiento',
                suffix: GestureDetector(
                  child: Icon(Icons.close),
                  onTap: () {
                    controladorFechaNacimiento.clear();
                  },
                )),
          ),
        ),
        MaterialButton(
          minWidth: 200.0,
          height: 60.0,
          onPressed: () {
            if (controladorFoto.text.isNotEmpty &&
                controladorNombre.text.isNotEmpty &&
                controladorFechaNacimiento.text.isNotEmpty &&
                controladorApellido.text.isNotEmpty &&
                controladorProfesion.text.isNotEmpty) {
              persona = new Persona(
                foto: controladorFoto.text,
                nombre: controladorNombre.text,
                apellido: controladorApellido.text,
                profesion: controladorProfesion.text,
                fechaNacimiento: controladorFechaNacimiento.text,
              );
              Navigator.pop(context, persona);
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        content: Text('Modificado correctamente'),
                      ));
            } else {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        content: Text('No se aceptan campos vacios'),
                      ));
            }
          },
          color: Colors.lightBlue,
          child: Text('Modificar Persona',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ]),
    );
    ;
  }
}
