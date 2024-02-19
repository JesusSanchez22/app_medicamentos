import 'dart:io';

import 'package:app_medicamentos/modelos/base_datos.dart';
import 'package:app_medicamentos/modelos/medicamento.dart';
import 'package:app_medicamentos/modelos/toma.dart';
import 'package:app_medicamentos/modelos/tratamiento.dart';
import 'package:app_medicamentos/provider/temaProvider.dart';
import 'package:app_medicamentos/ventanas/ventana_lista_medicamentos.dart';
import 'package:app_medicamentos/ventanas/ventana_tratamientos.dart';
import 'package:app_medicamentos/widgets/CheckboxExampleApp.dart';
import 'package:app_medicamentos/widgets/MyAppBar.dart';
import 'package:app_medicamentos/widgets/MyDrawer.dart';
import 'package:app_medicamentos/widgets/MyScaffold.dart';
import 'package:app_medicamentos/widgets/percent_progress_indicator_bar.dart';
import 'package:app_medicamentos/ventanas/ventana_principal.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

//pantalla para modificar o borrar un tratamiento
class ModificarTratamiento extends StatefulWidget {
  final Map<String, dynamic> tratamientoData;

  //creo un constructor que requiere un map
  ModificarTratamiento({required this.tratamientoData});

  @override
  _ModificarTratamientoState createState() => _ModificarTratamientoState();
}

class _ModificarTratamientoState extends State<ModificarTratamiento> {
  //creo los objetos tratamiento y toma que usaré durante esta clase
  Tratamiento tratamiento = Tratamiento();

  Toma toma = Toma();

  final _formKey = GlobalKey<FormState>();

  DBHelper dbHelper = DBHelper();

  bool checkboxValue = true;

  @override
  void initState() {
    super.initState();

    //añado al objeto que he creado antes los datos del tratamiento
    //que hemos clicado en la ventana de listado
    tratamiento = Tratamiento.fromMap(widget.tratamientoData);
  }

  @override
  Widget build(BuildContext context) {
    final temaActual = Provider.of<TemaProvider>(context);
    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBar(titleText: "Modificar tratamiento"),
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
                    color: Colors.white,
                  ),
                ),
                tileColor: temaActual.temaActual.colorScheme.secondary,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),

                //creo una lista que aparecerá como opciones en un
                //DropdownMenu, nos servirá para poder asociar
                //un medicamento a un tratamiento
                child: FutureBuilder<List<Map<String, dynamic>>>(
                  future: dbHelper.getMedicamentos(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Text(
                          'No se encontraron medicamentos en la base de datos');
                    } else {
                      //creo los items que tendrá el dropDownMenu para que muestre
                      //el nombre del medicamento, pero que el valor que se
                      //recoja sea el id de dicho medicamento
                      List<DropdownMenuItem<int>> dropdownItems = snapshot.data!
                          .map<DropdownMenuItem<int>>((medicamento) {
                        return DropdownMenuItem<int>(
                          value: medicamento['id'],
                          child: Text(medicamento['nombre']),
                        );
                      }).toList();

                      return DropdownButtonFormField(
                        decoration: const InputDecoration(
                          labelText: 'Medicamento',
                          hintText:
                              'Introduce el medicamento de este tratamiento',
                          icon: Icon(Icons.medical_information),
                        ),
                        items: dropdownItems,
                        onChanged: (value) {
                          if (value != null) {
                            //durante el código voy asignando el valor de
                            //cada campo a los objetos que eh creado
                            tratamiento.id_medicamento = value;
                            toma.id_medicamento = value;
                          }
                        },
                        onSaved: (value) {
                          if (value != null) {
                            tratamiento.id_medicamento = value;
                            toma.id_medicamento = value;
                          } else {
                            tratamiento.id_medicamento = 0;
                            toma.id_medicamento = 0;
                          }
                        },
                      );
                    }
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: tratamiento.duracion_dias.toString(),
                        decoration: const InputDecoration(
                          labelText: 'Duración en días',
                          hintText:
                              'Introduce la duración del tratamiento en días',
                          icon: Icon(Icons.calendar_month),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (valor) {
                          if (valor == null || valor.isEmpty) {
                            return 'Por favor, introduce la duración del tratamiento en días';
                          }
                          return null;
                        },
                        onSaved: (valor) {
                          if (valor != null) {
                            tratamiento.duracion_dias = int.parse(valor);
                            toma.duracion_dias = int.parse(valor);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.white,
              ),
              ListTile(
                title: Text(
                  "Preescipción",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                tileColor: temaActual.temaActual.colorScheme.secondary,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: tratamiento.dosis.toString(),
                        decoration: const InputDecoration(
                          labelText: 'Dosis',
                          hintText: 'Introduce la cantidad en cada toma',
                          icon: Icon(Icons.add),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (valor) {
                          if (valor == null || valor.isEmpty) {
                            return 'Por favor, introduce la cantidad en cada toma';
                          }
                          return null;
                        },
                        onSaved: (valor) {
                          if (valor != null) {
                            int? dosis = int.tryParse(valor);
                            tratamiento.dosis = (dosis == null) ? 0 : dosis;
                            toma.dosis = (dosis == null) ? 0 : dosis;
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                          labelText: 'Frecuencia',
                          hintText: 'Introduce la frecuencia de tomas',
                          icon: Icon(Icons.timer),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 8,
                            child: Text("3 veces al día"),
                          ),
                          DropdownMenuItem(
                            value: 24,
                            child: Text("1 vez al día"),
                          ),
                          DropdownMenuItem(
                            value: 1,
                            child: Text("Cada hora"),
                          ),
                          DropdownMenuItem(
                            value: 2,
                            child: Text("Cada 2 horas"),
                          ),
                          DropdownMenuItem(
                            value: 12,
                            child: Text("Cada 12 horas"),
                          ),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            tratamiento.frecuencia = value;
                            toma.frecuencia = value;
                          }
                        },
                        onSaved: (value) {
                          if (value != null) {
                            tratamiento.frecuencia = value;
                            toma.frecuencia = value;
                          } else {
                            tratamiento.frecuencia = 0;
                            toma.frecuencia = 0;
                          }
                        },
                        value: tratamiento.frecuencia,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 3, top: 20),
                      child: Icon(Icons.notifications_active),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 20),
                      child: Text("Activo"),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 20),

                        //uso un Checkbox personalizado para controlar
                        //si el tratamiento está activo o no
                        child: CheckboxExample(onChanged: (value) {
                          setState(() {
                            checkboxValue = value!;

                            //si está activado el tratamiento estará "activo"
                            //si no está activado el tratamiento estará "no activo"
                            if (checkboxValue) {
                              tratamiento.activo = "activo";
                              toma.activo = "activo";
                            } else {
                              tratamiento.activo = "no activo";
                              toma.activo = "no activo";
                            }
                          });
                        })),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      //creo un naavigation bar para tener opción de ir hacia atrás,
      //borrar el tratamiento o confirmar los datos
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
              Icons.delete,
              color: Colors.green,
            ),
            label: "Eliminar",
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
              final destino =
                  MaterialPageRoute(builder: (_) => Ventana_tratamientos());
              Navigator.push(context, destino);
              break;

            case 1:
              _eliminarTratamiento();

              break;

            case 2:
              _guardarTratamiento();

              //en caso de que el checkbox esté activo, es decir
              //que el tratamiento esté "activo" se creará además una
              //toma con los mismos datos qeu el tratamiento
              if (checkboxValue) {
                _guardarToma();
              }

              final destino =
                  MaterialPageRoute(builder: (_) => Ventana_tratamientos());
              Navigator.push(context, destino);
              break;
          }
        },
      ),
    );
  }

  //método para guardar toma
  void _guardarToma() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      await dbHelper.insertTomas(toma);
    }
  }

  //método para guardar tratamiento
  void _guardarTratamiento() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      await dbHelper.updateTratamiento(tratamiento);
    }
  }

  //método para eliminar tratamiento
  //mostrará un dialog que pedirá confirmación al usuario
  //de si está seguro de eliminar el tratamiento o no
  void _eliminarTratamiento() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Confirmación"),
            content:
                Text("¿Estás seguro de que deseas eliminar este tratamiento?"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text("Cancelar"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text("Aceptar"),
              )
            ],
          );
        }).then((confirmed) {
      if (confirmed != null && confirmed) {
        dbHelper.deleteTratamiento(tratamiento);
        dbHelper.deleteToma(toma);
        final destino =
            MaterialPageRoute(builder: (_) => Ventana_tratamientos());
        Navigator.push(context, destino);
      } else {}
    });
  }
}
