import 'package:app_medicamentos/modelos/medicamento.dart';
import 'package:app_medicamentos/modelos/toma.dart';
import 'package:app_medicamentos/modelos/tratamiento.dart';
import 'package:app_medicamentos/modelos/usuario.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//clase en la que gestiono todo lo relacionado a la base de datos sqlite
class DBHelper {
  static Database? _database;

  //nombre de la base de datos
  static const String dbName = 'DBMedicamentos.db';

  //método para obtener la base de datos
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDatabase();
    return _database;
  }

  //método para crear la base de datos
  //con las tablas que usaremos
  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS Medicamentos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nombre TEXT,
            descripcion TEXT,
            imagenMedicamento TEXT,
            imagenEnvase TEXT,
            cantidadActual INTEGER,
            cantidadPorEnvase INTEGER,
            cantidadMinima INTEGER
          )
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS Usuarios (
            id_usuario INTEGER PRIMARY KEY AUTOINCREMENT,
            correo TEXT,
            nombre TEXT,
            contrasena TEXT,
            tipo_perfil TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS Tratamientos (
            id_tratamiento integer primary key autoincrement,
            id_medicamento integer,
            duracion_dias integer,
            dosis integer,
            frecuencia integer,
            activo TEXT,
            foreign key(id_medicamento)
              references medicamentos(id) 
              on delete cascade
          )
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS Tomas (
            id_toma integer primary key autoincrement,
            id_medicamento integer,
            duracion_dias integer,
            dosis integer,
            frecuencia integer,
            activo TEXT,
            completada TEXT DEFAULT "no",
            foreign key(id_medicamento)
              references medicamentos(id) 
              on delete cascade
          )
        ''');
      },
    );
  }

  //Métodos para cada tabla

  //Usuarios
  //Obtener usuarios
  Future<List<Map<String, dynamic>>> getUsuarios() async {
    Database? db = await database;
    return await db!.query('Usuarios');
  }

  //añadir un usuario
  Future<int> insertUsuario(Usuario usuario) async {
    Database? db = await database;
    return await db!.insert("Usuarios", usuario.toMap());
  }

  //actualizar un usuario
  Future<int> updateUsuario(Usuario usuario) async {
    Database? db = await database;
    return await db!.update(
      'Usuarios',
      usuario.toMap(),
      where: 'id_usuario = ?',
      whereArgs: [usuario.id_usuario],
    );
  }

  //verificar si la contraseña coincide para el correo introducido
  Future<bool> verificarCredenciales(String correo, String contrasena) async {
    Database? db = await database;
    List<Map<String, dynamic>> usuarios = await db!.query(
      'Usuarios',
      where: 'correo = ? AND contrasena = ?',
      whereArgs: [correo, contrasena],
    );

    return usuarios.isNotEmpty;
  }

  //verificar si el correo ya existe en la base de datos
  Future<Usuario?> verificarUsuarioExiste(String correo) async {
    Database? db = await database;
    List<Map<String, dynamic>> results =
        await db!.query("Usuarios", where: "correo = ?", whereArgs: [correo]);

    if (results.isNotEmpty) {
      return Usuario.fromMap(results.first);
    } else {
      return null;
    }
  }

  //Medicamentos
  //obtener medicamentos
  Future<List<Map<String, dynamic>>> getMedicamentos() async {
    Database? db = await database;
    return await db!.query('Medicamentos');
  }

  //insertar un medicamento
  Future<int> insertMedicamento(Medicamento medicamento) async {
    Database? db = await database;
    return await db!.insert("Medicamentos", medicamento.toMap());
  }

  //actualizar un medicamento
  Future<int> updateMedicamento(Medicamento medicamento) async {
    Database? db = await database;
    return await db!.update(
      'Medicamentos',
      medicamento.toMap(),
      where: 'id = ?',
      whereArgs: [medicamento.id],
    );
  }

  //eliminar un medicamento
  Future<int> deleteMedicamento(Medicamento medicamento) async {
    Database? db = await database;
    return await db!.delete(
      "Medicamentos",
      where: 'id = ?',
      whereArgs: [medicamento.id],
    );
  }

  //Tratamientos
  //obtener tratamientos
  Future<List<Map<String, dynamic>>> getTratamientos() async {
    Database? db = await database;
    return await db!.query('Tratamientos');
  }

  //añadir un tratamiento
  Future<int> insertTratamiento(Tratamiento tratamiento) async {
    Database? db = await database;
    return await db!.insert("Tratamientos", tratamiento.toMap());
  }

  //actualizar un tratamiento
  Future<int> updateTratamiento(Tratamiento tratamiento) async {
    Database? db = await database;
    return await db!.update(
      'Tratamientos',
      tratamiento.toMap(),
      where: 'id_tratamiento = ?',
      whereArgs: [tratamiento.id_tratamiento],
    );
  }

  //eliminar un tratamiento
  Future<int> deleteTratamiento(Tratamiento tratamiento) async {
    Database? db = await database;
    return await db!.delete(
      "Tratamientos",
      where: 'id_tratamiento = ?',
      whereArgs: [tratamiento.id_tratamiento],
    );
  }

  //eliminar un tratamiento desde su id_tratamiento
  Future<int> deleteTratamientoById(int id_tratamiento) async {
    Database? db = await database;
    return await db!.delete(
      "Tratamientos",
      where: 'id_tratamiento = ?',
      whereArgs: [id_tratamiento],
    );
  }

  //Tomas
  //obtener tomas
  Future<List<Map<String, dynamic>>> getTomas() async {
    Database? db = await database;
    return await db!.query('Tomas');
  }

  //añadir una toma
  Future<int> insertTomas(Toma toma) async {
    Database? db = await database;
    return await db!.insert("Tomas", toma.toMap());
  }

  //eliminar una toma
  Future<int> deleteToma(Toma toma) async {
    Database? db = await database;
    return await db!.delete(
      "Tomas",
      where: 'id_toma = ?',
      whereArgs: [toma.id_toma],
    );
  }

  //eliminar una toma por su id
  Future<int> deleteTomaById(int id_toma) async {
    Database? db = await database;
    return await db!.delete(
      "Tomas",
      where: 'id_toma = ?',
      whereArgs: [id_toma],
    );
  }

  //obtener las tomas cuyo campo completada sea "si"
  Future<List<Map<String, dynamic>>> getTomasCompletadas() async {
    Database? db = await database;
    return await db!.query('Tomas', where: 'completada = ?', whereArgs: ['si']);
  }

  //obtener las tomas cuyo campo completada sea "no"
  Future<List<Map<String, dynamic>>> getTomasNoCompletadas() async {
    Database? db = await database;
    return await db!.query('Tomas', where: 'completada = ?', whereArgs: ['no']);
  }

  //actualizar el campo "completada" de una toma para que sea "si"
  Future<int> marcarTomaComoCompletada(int idToma) async {
    Database? db = await database;
    return await db!.update(
      'Tomas',
      {'completada': 'si'},
      where: 'id_toma = ?',
      whereArgs: [idToma],
    );
  }

  //actualizar el campo "completada" de una toma para que sea "no"
  Future<int> marcarTomaComoNoCompletada(int idToma) async {
    Database? db = await database;
    return await db!.update(
      'Tomas',
      {'completada': 'no'},
      where: 'id_toma = ?',
      whereArgs: [idToma],
    );
  }
}
