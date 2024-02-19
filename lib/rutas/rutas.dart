import 'package:app_medicamentos/ventanas/ventanaLoginRegister.dart';
import 'package:app_medicamentos/ventanas/ventana_configuracion.dart';
import 'package:app_medicamentos/ventanas/ventana_lista_medicamentos.dart';
import 'package:app_medicamentos/ventanas/ventana_perfil.dart';
import 'package:app_medicamentos/ventanas/ventana_principal.dart';
import 'package:app_medicamentos/ventanas/ventana_tratamientos.dart';
import 'package:flutter/material.dart';

//clase para indicar cada una de las rutas
//de las ventanas de nuestra app, sirve para
//crear los botones del Drawer que nos permiten
//movernos entre pantallas
final rutasPaginas = <_ruta>[
  _ruta(Icons.home, 'Inicio', VentanaPrincipal()),
  _ruta(Icons.medical_information, 'Tratamientos', Ventana_tratamientos()),
  _ruta(Icons.local_pharmacy, 'Medicamentos', Ventana_lista_medicamentos()),
  _ruta(Icons.person, 'Perfil', VentanaPerfil()),
  _ruta(Icons.settings, 'Configuración', PaginaConfiguracion()),
  _ruta(Icons.door_back_door, 'Salir', VentanaLoginRegister()),
];

class _ruta {
  final IconData icono;
  final String titulo;
  final Widget pagina;

  _ruta(this.icono, this.titulo, this.pagina);
}
