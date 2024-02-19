import 'package:app_medicamentos/modelos/tratamiento.dart';
import 'package:app_medicamentos/provider/temaProvider.dart';
import 'package:app_medicamentos/provider/userProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_medicamentos/modelos/base_datos.dart';
import 'package:app_medicamentos/ventanas/crear_tratamiento.dart';
import 'package:app_medicamentos/widgets/CupertinoSwitch.dart';
import 'package:app_medicamentos/widgets/MyAppBar.dart';
import 'package:app_medicamentos/widgets/MyDrawer.dart';
import 'package:app_medicamentos/ventanas/crear_medicamento.dart';
import 'package:provider/provider.dart';

//ventana de "lobby" de mi aplicación
class VentanaPrincipal extends StatefulWidget {
  @override
  _VentanaPrincipalState createState() => _VentanaPrincipalState();
}

class _VentanaPrincipalState extends State<VentanaPrincipal> {
  DBHelper dbHelper = DBHelper();

  //creo dos listas donde almacenaré las tomas del usuario
  late List<Map<String, dynamic>> tomasFuturas = [];
  late List<Map<String, dynamic>> tomasCompletadas = [];

  @override
  void initState() {
    super.initState();

    //llamo a dos métodos para cargar tomas al iniciar la ventana
    _cargarTomasFuturas();
    _cargarTomasCompletadas();
  }

  //metodo que cargará la tomas NO COMPLETADAS desde la base de datos
  //y meterá el resultado en la lista de tomasFuturas
  Future<void> _cargarTomasFuturas() async {
    tomasFuturas = await dbHelper.getTomasNoCompletadas();
    setState(() {});
  }

  //metodo que cargará la tomas COMPLETADAS desde la base de datos
  //y meterá el resultado en la lista de tomasCompletadas
  Future<void> _cargarTomasCompletadas() async {
    tomasCompletadas = await dbHelper.getTomasCompletadas();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //llamo al provider temaActual para seguir el mismo esquema de colores que tengo
    //ahí definido
    final temaActual = Provider.of<TemaProvider>(context);
    return Scaffold(
      appBar: const MyAppBar(titleText: 'Inicio'),
      drawer: const MyDrawer(),
      body: Container(
        //cargaré el tema correspondiente en cada sección de la app
        color: temaActual.temaActual.colorScheme.surface,
        child: Padding(
          padding: EdgeInsets.only(top: 30, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10, bottom: 0),
                child: Text(
                  'Futuras tomas:',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreen),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  //uso un builder para crear la lista, será de tipo GridView para poder
                  //modificar las dimensiones y que sea más visual
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 500,
                      childAspectRatio: 2,
                    ),
                    itemCount: tomasFuturas.length,
                    itemBuilder: (context, index) {
                      //recogemos en una variable Map los datos de cada una de las tomasFuturas
                      //según su posición en la lista
                      Map<String, dynamic> tratamientoData =
                          tomasFuturas[index];

                      //gracias a la variable map podremos sacar los datos de la toma que queramos
                      //mostrar
                      int frecuenciaToma = tratamientoData["frecuencia"];
                      int dosis = tratamientoData["dosis"];

                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.lightGreen,
                        ),
                        margin: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Padding(
                              //aquí cargaríamos la foto del medicamento asociado a la toma,
                              //esto sería una funcionalidad para el futuro, de momento
                              //será una imagen por defecto
                              padding: EdgeInsets.only(left: 20),
                              child: Image.asset(
                                "assets/paracetamol_caja.jpg",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 45),
                              child: Column(
                                children: [
                                  const Text(
                                    "Proxima toma en:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Text(
                                    "$frecuenciaToma horas",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(right: 70, top: 10),
                                    child: Text(
                                      "Dosis: $dosis",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30),

                              //con un boton switch personalizado le indico a la toma
                              //que ha sido completada
                              child: BotonSwitchOff(
                                  //por defecto el botón estará desactivado
                                  defaultLight: false,
                                  onChanged: (bool value) {
                                    if (value) {
                                      //al activarlo, la toma se marca como completada
                                      setState(() {
                                        //sacamos el id de la toma en cuestión
                                        int id = tomasFuturas[index]["id_toma"];

                                        //y con el id, mediante un método que modifica el registro
                                        //de la base de datos, marco la toma como completada
                                        dbHelper.marcarTomaComoCompletada(id);

                                        //elimino el registro de tomasFuturas
                                        tomasFuturas
                                            .remove(tomasFuturas[index]);

                                        //vuelvo a cargar ambas listas para que se actualicen
                                        _cargarTomasFuturas();
                                        _cargarTomasCompletadas();
                                      });
                                    }
                                  }),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, bottom: 10, top: 20),
                child: Text(
                  'Tomas completadas:',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreen),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),

                  //para el apartado de tomasCompletadas seguiré la misma metodología
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 500,
                      childAspectRatio: 2,
                    ),
                    itemCount: tomasCompletadas.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> tomasData = tomasCompletadas[index];

                      int frecuenciaToma = tomasData["frecuencia"];
                      int dosis = tomasData["dosis"];

                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.lightGreen,
                        ),
                        margin: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Image.asset(
                                "assets/paracetamol_caja.jpg",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, top: 45),
                              child: Column(
                                children: [
                                  const Text(
                                    "Proxima toma en:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Text(
                                    "$frecuenciaToma horas",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(right: 70, top: 10),
                                    child: Text(
                                      "Dosis: $dosis",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: BotonSwitchOff(
                                  //el switch por defecto estará activado en esta lista
                                  defaultLight: true,
                                  onChanged: (bool value) {
                                    setState(() {
                                      print(tomasCompletadas[index]);

                                      //hacemos el mismo proceso que en la lista anterior
                                      //pero al revés
                                      int id =
                                          tomasCompletadas[index]["id_toma"];

                                      tomasCompletadas
                                          .remove(tomasCompletadas[index]);

                                      dbHelper.marcarTomaComoNoCompletada(id);

                                      _cargarTomasFuturas();
                                      _cargarTomasCompletadas();

                                      print(tomasCompletadas);
                                    });
                                  }),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
