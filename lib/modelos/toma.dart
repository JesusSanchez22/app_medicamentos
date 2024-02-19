//clase modelo para las tomas
class Toma {
  int? _id_toma;
  late int _id_medicamento;
  late int _duracion_dias;
  late int _dosis;
  late int _frecuencia;
  late String _activo;
  late String _completada;

  //constructor
  Toma() {
    this._id_medicamento = 0;
    this._duracion_dias = 0;
    this._dosis = 0;
    this._frecuencia = 0;
    this._activo = "";
    this._completada = "no";
  }

  //constructor sin id
  Toma.withoutId(this._id_medicamento, this._duracion_dias, this._dosis,
      this._frecuencia, this._activo);
  //constructor con id
  Toma.withId(this._id_toma, this._id_medicamento, this._duracion_dias,
      this._dosis, this._frecuencia, this._activo);
  //constructor con map
  Toma.fromMap(Map<String, dynamic> map) {
    this._id_toma = (map['id_toma'] != null) ? map['id_toma'] : null;
    this._id_medicamento =
        (map['id_medicamento'] != null) ? map['id_medicamento'] : 0;
    this._duracion_dias =
        (map['duracion_dias'] != null) ? map['duracion_dias'] : 0;
    this._dosis = (map['dosis'] != null) ? map['dosis'] : 0;
    this._frecuencia = (map['frecuencia'] != null) ? map['frecuencia'] : 0;
    this._activo = (map['activo'] != null) ? map['activo'] : "";
  }

  //Getters y setters
  int? get id_toma => _id_toma;
  int get id_medicamento => _id_medicamento;
  int get duracion_dias => _duracion_dias;
  int get dosis => _dosis;
  int get frecuencia => _frecuencia;
  String get activo => _activo;
  String get completada => _completada;

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

  set completada(String completada) {
    this._completada = completada;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id_toma != null) map['id_toma'] = _id_toma;
    map['id_medicamento'] = _id_medicamento;
    map['duracion_dias'] = _duracion_dias;
    map['dosis'] = _dosis;
    map['frecuencia'] = _frecuencia;
    map['activo'] = _activo;
    map['completada'] = _completada;
    return map;
  }
}
