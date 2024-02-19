import 'package:app_medicamentos/modelos/base_datos.dart';
import 'package:app_medicamentos/provider/modoProvider.dart';
import 'package:app_medicamentos/provider/temaProvider.dart';
import 'package:app_medicamentos/ventanas/bienvenida.dart';
import 'package:app_medicamentos/ventanas/ventana_principal.dart';
import 'package:app_medicamentos/ventanas/ventana_tratamientos.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:app_medicamentos/main.dart';
import 'package:provider/provider.dart';
import "provider/userProvider.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //metood para iniciar la base de datos
  await DBHelper().initDatabase();

  runApp(
    //cargamos los distintos providers que usaremos por la aplicación
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            //cargamos el tema claro por defecto
            create: (_) => TemaProvider(0)),
        ChangeNotifierProvider(
            //cargamos el usuario por defecto
            create: (_) => UserProvider()),
        ChangeNotifierProvider(
            //cargamos el modo de funcionamiento por defecto
            create: (_) => ModoProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final temaActual = Provider.of<TemaProvider>(context).temaActual;

    return MaterialApp(
      title: 'MedicApp',
      theme: temaActual,
      home: Bienvenida(),
    );
  }
}
