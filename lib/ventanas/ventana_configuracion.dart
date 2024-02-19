import 'dart:ffi';

import 'package:app_medicamentos/provider/modoProvider.dart';
import 'package:app_medicamentos/provider/temaProvider.dart';
import 'package:app_medicamentos/provider/userProvider.dart';
import 'package:app_medicamentos/widgets/MyAppBar.dart';
import 'package:app_medicamentos/widgets/MyDrawer.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

//ventana en la que modificaremos la configuración de la app
class PaginaConfiguracion extends StatefulWidget {
  PaginaConfiguracion({super.key});

  @override
  State<PaginaConfiguracion> createState() => _PaginaConfiguracionState();
}

class _PaginaConfiguracionState extends State<PaginaConfiguracion> {
  @override
  Widget build(BuildContext context) {
    //meto los provider que voy a usar en una variable
    final temaActual = Provider.of<TemaProvider>(context);
    final modoTrabajo = Provider.of<ModoProvider>(context);

    setState(() {});
    return Scaffold(
      appBar: const MyAppBar(titleText: 'Configuración'),
      drawer: const MyDrawer(),
      body: Center(
        child: ListView(children: [
          ListTile(
            title: Text(
              "Ajustes de apariencia",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: temaActual.temaActual.colorScheme.onPrimary,
              ),
            ),
            tileColor: temaActual.temaActual.colorScheme.secondary,
          ),
          //uso el "temaProvider" para cambiar el esquema de colores
          //de la app a modo oscuro, o modo claro
          SwitchListTile(
            title: Text(
              "Tema oscuro",
              style: TextStyle(
                color: temaActual.temaActual.colorScheme.onPrimary,
              ),
            ),
            value: temaActual.temaOscuro,
            onChanged: (value) => temaActual.temaOscuro = value,
          ),

          ListTile(
            title: Text(
              "Ajustes de usuario",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: temaActual.temaActual.colorScheme.onPrimary,
              ),
            ),
            tileColor: temaActual.temaActual.colorScheme.secondary,
          ),
          //uso el modoProvider para cambiar el modo de
          //funcionamiento de los datos de la app
          //en un futuro servirá para poder cambiar entre
          //la base de datos SQLite y una API
          SwitchListTile(
            title: Text(
              "Funcionamiento local",
              style: TextStyle(
                color: temaActual.temaActual.colorScheme.onPrimary,
              ),
            ),
            value: modoTrabajo.modoLocal,
            onChanged: (value) => modoTrabajo.modoLocal = value,
          ),
        ]),
      ),
    );
  }
}
