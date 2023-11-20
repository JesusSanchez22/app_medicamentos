import 'package:app_medicamentos/ventanas/ventana_principal.dart';
import 'package:flutter/material.dart';
import 'package:app_medicamentos/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const VentanaPrincipal(),
    );
  }
}

