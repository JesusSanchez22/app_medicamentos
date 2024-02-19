//clase modelo para los usuarios
class Usuario {
  int? _id_usuario;
  late String _correo;
  late String _nombre;
  late String _contrasena;
  late String _tipo_perfil;

  //constructor
  Usuario(int? id_usuario, String correo, String nombre, String contrasena,
      String tipo_perfil) {
    this._id_usuario = id_usuario;
    this._correo = correo;
    this._nombre = nombre;
    this._contrasena = contrasena;
    this._tipo_perfil = tipo_perfil;
  }

  //constructor sin id
  Usuario.withoutId(
      this._correo, this._nombre, this._contrasena, this._tipo_perfil);

  Usuario.withId(this._id_usuario, this._correo, this._nombre, this._contrasena,
      this._tipo_perfil);

  //constructor con map

  Usuario.fromMap(Map<String, dynamic> map) {
    this._id_usuario = (map['id_usuario'] != null) ? map['id_usuario'] : null;
    this._correo = (map['correo'] != null) ? map['correo'] : "";
    this._nombre = (map['nombre'] != null) ? map['nombre'] : "";
    this._contrasena = (map['contrasena'] != null) ? map['contrasena'] : "";
    this._tipo_perfil = (map['tipo_perfil'] != null) ? map['tipo_perfil'] : "";
  }

  //Getters y setters
  int? get id_usuario => _id_usuario;
  String get correo => _correo;
  String get nombre => _nombre;
  String get contrasena => _contrasena;
  String get tipo_perfil => _tipo_perfil;

  set correo(String correo) {
    this._correo = correo;
  }

  set nombre(String nombre) {
    this._nombre = nombre;
  }

  set contrasena(String contrasena) {
    this._contrasena = contrasena;
  }

  set tipo_perfil(String tipo_perfil) {
    this._tipo_perfil = tipo_perfil;
  }

  set id_usuario(int? id_usuario) {
    this._id_usuario = id_usuario;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id_usuario != null) map['id_usuario'] = _id_usuario;
    map['nombre'] = _nombre;
    map['correo'] = _correo;
    map['contrasena'] = _contrasena;
    map['tipo_perfil'] = _tipo_perfil;
    return map;
  }
}
