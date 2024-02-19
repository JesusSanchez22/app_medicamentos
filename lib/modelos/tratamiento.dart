//clase modelo para los tratamientos
class Tratamiento {
  int? _id_tratamiento;
  late int _id_medicamento;
  late int _duracion_dias;
  late int _dosis;
  late int _frecuencia;
  late String _activo;

  //constructor
  Tratamiento() {
    this._id_medicamento = 0;
    this._duracion_dias = 0;
    this._dosis = 0;
    this._frecuencia = 0;
    this._activo = "";
  }

  //constructor sin id
  Tratamiento.withoutId(this._id_medicamento, this._duracion_dias, this._dosis,
      this._frecuencia, this._activo);
  //constructor con id
  Tratamiento.withId(this._id_tratamiento, this._id_medicamento,
      this._duracion_dias, this._dosis, this._frecuencia, this._activo);
  //constructor con map
  Tratamiento.fromMap(Map<String, dynamic> map) {
    this._id_tratamiento =
        (map['id_tratamiento'] != null) ? map['id_tratamiento'] : null;
    this._id_medicamento =
        (map['id_medicamento'] != null) ? map['id_medicamento'] : 0;
    this._duracion_dias =
        (map['duracion_dias'] != null) ? map['duracion_dias'] : 0;
    this._dosis = (map['dosis'] != null) ? map['dosis'] : 0;
    this._frecuencia = (map['frecuencia'] != null) ? map['frecuencia'] : 0;
    this._activo = (map['activo'] != null) ? map['activo'] : "";
  }

  //Getters y setters
  int? get id_tratamiento => _id_tratamiento;
  int get id_medicamento => _id_medicamento;
  int get duracion_dias => _duracion_dias;
  int get dosis => _dosis;
  int get frecuencia => _frecuencia;
  String get activo => _activo;

  set id_medicamento(int id_medicamento) {
    this._id_medicamento = id_medicamento;
  }

  set duracion_dias(int duracion_dias) {
    this._duracion_dias = duracion_dias;
  }

  set dosis(int dosis) {
    this._dosis = dosis;
  }

  set frecuencia(int frecuencia) {
    this._frecuencia = frecuencia;
  }

  set activo(String activo) {
    this._activo = activo;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id_tratamiento != null) map['id_tratamiento'] = _id_tratamiento;
    map['id_medicamento'] = _id_medicamento;
    map['duracion_dias'] = _duracion_dias;
    map['dosis'] = _dosis;
    map['frecuencia'] = _frecuencia;
    map['activo'] = _activo;
    return map;
  }
}
