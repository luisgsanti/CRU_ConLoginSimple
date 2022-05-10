class Login {
  var usuario;
  var clave;
  var nombre;

  Login({
    this.usuario,
    this.clave,
    this.nombre,
  });
}

List<Login> logins = [
  Login(usuario: 'luis', clave: '123', nombre: 'Luis Gomez'),
];

class Persona {
  var foto;
  var nombre;
  var apellido;
  var profesion;
  var fechaNacimiento;

  Persona(
      {this.foto,
      this.nombre,
      this.apellido,
      this.profesion,
      this.fechaNacimiento});
}

List<Persona> personas = [
  Persona(
      foto:
          'https://e7.pngegg.com/pngimages/448/231/png-clipart-thinking-man-thinking-man-thumbnail.png',
      nombre: 'Yambra',
      apellido: 'Flow',
      profesion: 'Cantante',
      fechaNacimiento: '10/04/1999'),
];
