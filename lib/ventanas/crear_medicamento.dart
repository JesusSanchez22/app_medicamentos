import 'dart:io';

import 'package:app_medicamentos/modelos/base_datos.dart';
import 'package:app_medicamentos/modelos/medicamento.dart';
import 'package:app_medicamentos/provider/temaProvider.dart';
import 'package:app_medicamentos/ventanas/ventana_lista_medicamentos.dart';
import 'package:app_medicamentos/widgets/MyAppBar.dart';
import 'package:app_medicamentos/widgets/MyDrawer.dart';
import 'package:app_medicamentos/widgets/MyScaffold.dart';
import 'package:app_medicamentos/widgets/percent_progress_indicator_bar.dart';
import 'package:app_medicamentos/ventanas/ventana_principal.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

//ventana para crear un nuevo medicamento
class CrearMedicamento extends StatefulWidget {
  @override
  _CrearMedicamentoState createState() => _CrearMedicamentoState();
}

class _CrearMedicamentoState extends State<CrearMedicamento> {
  //variables que voy a usar
  Medicamento medicamento = new Medicamento();
  CameraController? controller;
  String imagePath = "";
  final _formKey = GlobalKey<FormState>();
  List<CameraDescription>? cameras;

  DBHelper dbHelper = DBHelper();

  //llamo al método para iniciar la cámara al abrir la ventana
  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  //método para iniciar la cámara
  //primero controlará que haya alguna cámara disponible
  @override
  Future<void> initializeCamera() async {
    Database? database = await dbHelper.database;
    await availableCameras().then((availableCameras) {
      cameras = availableCameras;
      if (cameras != null && cameras!.isNotEmpty) {
        controller = CameraController(cameras![0], ResolutionPreset.max);
        controller?.initialize().then((_) {
          if (!mounted) {
            return;
          }
          setState(() {});
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final temaActual = Provider.of<TemaProvider>(context);

    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(titleText: "Agregar medicamento"),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "Datos generales",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: temaActual.temaActual.colorScheme.onSecondary,
                  ),
                ),
                tileColor: temaActual.temaActual.colorScheme.secondary,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    hintText: 'Introduce el nombre del medicamento',
                    icon: Icon(Icons.medication),
                  ),

                  //controlo que los campos no estén vacíos para
                  //poder crear un medicamento
                  validator: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'Por favor, introduce el nombre del medicamento';
                    }
                    return null;
                  },

                  //voy añadiendo los datos de cada campo en el
                  //objeto medicamento que he creado al inicio
                  onSaved: (valor) {
                    if (valor != null) {
                      medicamento.nombre = valor;
                    }
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Descripcion',
                    hintText: 'Introduce la descripción del medicamento',
                    icon: Icon(Icons.textsms),
                  ),
                  validator: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'Por favor, introduce la descripcion del medicamento';
                    }
                    return null;
                  },
                  onSaved: (valor) {
                    if (valor != null) {
                      medicamento.descripcion = valor;
                    }
                  },
                ),
              ),
              Divider(
                color: temaActual.temaActual.colorScheme.surface,
              ),
              ListTile(
                title: Text(
                  "Imagenes",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                tileColor: temaActual.temaActual.colorScheme.secondary,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Medicamento",
                      style: TextStyle(
                        color: temaActual.temaActual.colorScheme.onPrimary,
                      ),
                    ),

                    //creo un icono que al ser clicado abrirá la
                    //cámara y sacará una foto
                    IconButton(
                      icon: Icon(Icons.add_a_photo),
                      onPressed: () async {
                        //creo una variable image con la imagen que acabo de obtener
                        final image = await controller!.takePicture();
                        setState(() {
                          //guardo el path de la imagen en una variable
                          imagePath = image.path;

                          //inserto el path en el medicamento que he creado
                          //en este caso, en imagenMedicamento
                          medicamento.imagenMedicamento = imagePath;

                          onSaved:
                          (imagePath) {
                            medicamento.imagenMedicamento = imagePath;
                          };
                        });
                      },
                    ),
                    Text(
                      "Envase",
                      style: TextStyle(
                        color: temaActual.temaActual.colorScheme.onPrimary,
                      ),
                    ),
                    //creo un icono que al ser clicado abrirá la
                    //cámara y sacará una foto
                    IconButton(
                      icon: Icon(Icons.add_a_photo),
                      onPressed: () async {
                        //creo una variable image con la imagen que acabo de obtener
                        final image = await controller!.takePicture();
                        setState(() {
                          //guardo el path de la imagen en una variable
                          imagePath = image.path;

                          //inserto el path en el medicamento que he creado
                          //en este caso, en imagenEnvase
                          medicamento.imagenEnvase = imagePath;

                          onSaved:
                          (imagePath) {
                            medicamento.imagenEnvase = imagePath;
                          };
                        });
                      },
                    ),
                  ],
                ),
              ),

              //si el path de la imagen se ha creado correctamente
              //aparecerá dicha imagen en la pantalla
              if (imagePath != "")
                Container(
                  width: 300,
                  height: 300,
                  child: Image.file(
                    File(imagePath),
                  ),
                ),
              Divider(
                color: temaActual.temaActual.colorScheme.surface,
              ),
              ListTile(
                title: const Text(
                  "Cantidades",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                tileColor: temaActual.temaActual.colorScheme.secondary,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Cantidad actual',
                          hintText:
                              'Introduce la cantidad actual del medicamento',
                          icon: Icon(Icons.battery_3_bar),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (valor) {
                          if (valor == null || valor.isEmpty) {
                            return 'Por favor, introduce la cantidad actual del medicamento';
                          }
                          return null;
                        },
                        onSaved: (valor) {
                          if (valor != null) {
                            medicamento.cantidadActual = int.parse(valor);
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Cantidad envase',
                          hintText: 'Introduce la cantidad por envase',
                          icon: Icon(Icons.battery_full),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (valor) {
                          if (valor == null || valor.isEmpty) {
                            return 'Por favor, introduce la cantidad por envase del medicamento';
                          }
                          return null;
                        },
                        onSaved: (valor) {
                          if (valor != null) {
                            int? cActual = int.tryParse(valor);
                            medicamento.cantidadPorEnvase =
                                (cActual == null) ? 0 : cActual;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Cantidad minima antes de reponer',
                          hintText:
                              'Introduce la cantidad minima del medicamento',
                          icon: Icon(Icons.battery_0_bar),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (valor) {
                          if (valor == null || valor.isEmpty) {
                            return 'Por favor, introduce la cantidad minima del medicamento';
                          }
                          return null;
                        },
                        onSaved: (valor) {
                          if (valor != null) {
                            int? cMinima = int.tryParse(valor);
                            medicamento.cantidadMinima =
                                (cMinima == null) ? 0 : cMinima;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: temaActual.temaActual.colorScheme.surface,
              ),
            ],
          ),
        ),
      ),

      //creo un navigation bar para tener la opción
      //de ir hacia atrás o de confirmar la inserción
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.green,
        selectedItemColor: Colors.green,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.skip_previous, color: Colors.green),
            label: "Atrás",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check,
              color: Colors.green,
            ),
            label: "Confirmar",
          ),
        ],
        onTap: (value) {
          switch (value) {
            case 0:
              final destino = MaterialPageRoute(
                  builder: (_) => Ventana_lista_medicamentos());
              Navigator.push(context, destino);
              break;

            case 1:
              _guardarMedicamento();
              final destino = MaterialPageRoute(
                  builder: (_) => Ventana_lista_medicamentos());
              Navigator.push(context, destino);
              break;
          }
        },
      ),
    );
  }

  //método para guardar el medicamento en la base de datos
  void _guardarMedicamento() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      await dbHelper.insertMedicamento(medicamento);
    }
  }
}
