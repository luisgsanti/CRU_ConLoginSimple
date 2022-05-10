import 'package:examen_1/agregar.dart';
import 'package:examen_1/modelos.dart';
import 'package:examen_1/modificar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class inicio extends StatefulWidget {
  inicio({Key? key}) : super(key: key);

  @override
  State<inicio> createState() => _inicioState();
}

class _inicioState extends State<inicio> {
  List _listaPersonas = personas;
  List _login = logins;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(' Listado Completo'), actions: [
        Center(
          child: Text(
            _login[0].nombre,
          ),
        )
      ]),
      body: ListView.builder(
          itemCount: _listaPersonas.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => modificar(_listaPersonas[index]),
                    )).then((resultado) {
                  if (resultado != null) {
                    _listaPersonas.removeAt(index);
                    _listaPersonas.insert(index, resultado);
                  }

                  setState(() {});
                });
              },
              onLongPress: () {
                _eliminarPersona(context, _listaPersonas[index]);
              },
              title: Text(_listaPersonas[index].nombre +
                  ' ' +
                  _listaPersonas[index].apellido),
              subtitle: Text(_listaPersonas[index].profesion),
              leading: Flexible(
                child: CircleAvatar(
                  child: Image(
                    image: NetworkImage(_listaPersonas[index].foto),
                    /*height: 200,*/
                  ),
                  /*radius: 200.0,*/
                  backgroundColor: Colors.transparent,
                ),
              ),
              trailing: Text(_listaPersonas[index].fechaNacimiento),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => agregar(),
              )).then((resultado) {
            if (resultado != null) {
              _listaPersonas.addAll(resultado);
            }

            setState(() {});
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.brown,
      ),
    );
  }

  _eliminarPersona(context, Persona persona) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Eliminar Persona'),
              content: Text('Esta Seguro de Eliminar a: ' + persona.nombre),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      this._listaPersonas.remove(persona);
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    'Eliminar',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ));
  }
}
