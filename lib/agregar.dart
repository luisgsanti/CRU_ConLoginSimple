import 'package:examen_1/modelos.dart';
import 'package:flutter/material.dart';

class agregar extends StatefulWidget {
  agregar({Key? key}) : super(key: key);

  @override
  State<agregar> createState() => _agregarState();
}

class _agregarState extends State<agregar> {
  List<Persona> _personaAdd = [];

  //DateTime dateInput;

  late TextEditingController controladorFoto;
  late TextEditingController controladorNombre;
  late TextEditingController controladorApellido;
  late TextEditingController controladorProfesion;
  late TextEditingController controladorFechaNacimiento;

  @override
  void initState() {
    controladorFoto = TextEditingController();
    controladorNombre = TextEditingController();
    controladorApellido = TextEditingController();
    controladorProfesion = TextEditingController();
    controladorFechaNacimiento = TextEditingController();
  }

  Widget build(BuildContext context) {
    List _login = logins;
    return Scaffold(
      appBar: AppBar(title: Text(' Registrar nuevo'), actions: [
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
                labelText: 'Enlace Foto (PNG)',
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
              _personaAdd.add(Persona(
                foto: controladorFoto.text,
                nombre: controladorNombre.text,
                apellido: controladorApellido.text,
                profesion: controladorProfesion.text,
                fechaNacimiento: controladorFechaNacimiento.text,
              ));

              Navigator.pop(context, _personaAdd);
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        content: Text('Agregado correctamente'),
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
          child: Text('Registrar',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ]),
    );
  }

  void fecha() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      } else {
        setState() {
          //dateInput = value;
        }
      }
    });
  }
}
