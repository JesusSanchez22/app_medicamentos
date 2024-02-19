//clase modelo para los medicamentos
class Medicamento {
  int? _id;
  late String _nombre;
  late String _descripcion;
  late String _imagenMedicamento;
  late String _imagenEnvase;
  late int _cantidadPorEnvase;
  late int _cantidadActual;
  late int _cantidadMinima;

  //constructor
  Medicamento() {
    this._nombre = '';
    this._descripcion = '';
    this._imagenMedicamento = '';
    this._imagenEnvase = '';
    this._cantidadPorEnvase = 0;
    this._cantidadActual = 0;
    this._cantidadMinima = 0;
  }
  //constructor sin id
  Medicamento.withoutId(
      this._nombre,
      this._descripcion,
      this._imagenMedicamento,
      this._imagenEnvase,
      this._cantidadPorEnvase,
      this._cantidadActual,
      this._cantidadMinima);
  //constructor con id
  Medicamento.withId(
      this._id,
      this._nombre,
      this._descripcion,
      this._imagenMedicamento,
      this._imagenEnvase,
      this._cantidadPorEnvase,
      this._cantidadActual,
      this._cantidadMinima);
  //constructor con map
  Medicamento.fromMap(Map<String, dynamic> map) {
    this._id = (map['id'] != null) ? map['id'] : null;
    this._nombre = (map['nombre'] != null) ? map['nombre'] : '';
    this._descripcion = (map['descripcion'] != null) ? map['descripcion'] : '';
    this._imagenMedicamento =
        (map['imagenMedicamento'] != null) ? map['imagenMedicamento'] : '';
    this._imagenEnvase =
        (map['imagenEnvase'] != null) ? map['imagenEnvase'] : '';
    this._cantidadPorEnvase =
        (map['cantidadPorEnvase'] != null) ? map['cantidadPorEnvase'] : 0;
    this._cantidadActual =
        (map['cantidadActual'] != null) ? map['cantidadActual'] : 0;
    this._cantidadMinima =
        (map['cantidadMinima'] != null) ? map['cantidadMinima'] : 0;
  }

  //Getters y setters
  int? get id => _id;
  String get nombre => _nombre;
  String get descripcion => _descripcion;
  String get imagenMedicamento => _imagenMedicamento;
  String get imagenEnvase => _imagenEnvase;
  int get cantidadPorEnvase => _cantidadPorEnvase;
  int get cantidadActual => _cantidadActual;
  int get cantidadMinima => _cantidadMinima;

  set nombre(String nombre) {
    this._nombre = nombre;
  }

  set descripcion(String descripcion) {
    this._descripcion = descripcion;
  }

  set imagenMedicamento(String imagenMedicamento) {
    this._imagenMedicamento = imagenMedicamento;
  }

  set imagenEnvase(String imagenEnvase) {
    this._imagenEnvase = imagenEnvase;
  }

  set cantidadPorEnvase(int cantidadPorEnvase) {
    this._cantidadPorEnvase = cantidadPorEnvase;
  }

  set cantidadActual(int cantidadActual) {
    this._cantidadActual = cantidadActual;
  }

  set cantidadMinima(int cantidadMinima) {
    this._cantidadMinima = cantidadMinima;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) map['id'] = _id;
    map['nombre'] = _nombre;
    map['descripcion'] = _descripcion;
    map['imagenMedicamento'] = _imagenMedicamento;
    map['imagenEnvase'] = _imagenEnvase;
    map['cantidadPorEnvase'] = _cantidadPorEnvase;
    map['cantidadActual'] = _cantidadActual;
    map['cantidadMinima'] = _cantidadMinima;
    return map;
  }
}
