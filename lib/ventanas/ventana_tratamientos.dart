import 'package:app_medicamentos/modelos/base_datos.dart';
import 'package:app_medicamentos/modelos/medicamento.dart';
import 'package:app_medicamentos/provider/temaProvider.dart';
import 'package:app_medicamentos/ventanas/crear_tratamiento.dart';
import 'package:app_medicamentos/ventanas/modificar_medicamento.dart';
import 'package:app_medicamentos/ventanas/modificar_tratamiento.dart';
import 'package:app_medicamentos/widgets/MyAppBar.dart';
import 'package:app_medicamentos/widgets/MyDrawer.dart';
import 'package:app_medicamentos/ventanas/crear_medicamento.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//ventana para ver en forma de lista los tratamientos de la base de datos
class Ventana_tratamientos extends StatefulWidget {
  @override
  _VentanaTratamientosState createState() => _VentanaTratamientosState();
}

class _VentanaTratamientosState extends State<Ventana_tratamientos> {
  DBHelper dbHelper = DBHelper();

  //creo una lista para meter los tratamientos
  late List<Map<String, dynamic>> tratamientos = [];

  //llamamos al metodo cargarTratamientos al iniciar la ventana
  @override
  void initState() {
    super.initState();
    _cargarTratamientos();
  }

  //recogemos los tratamientos de la base de datos y los metemos en
  //la lista tratamientos
  Future<void> _cargarTratamientos() async {
    tratamientos = await dbHelper.getTratamientos();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final temaActual = Provider.of<TemaProvider>(context);
    return Scaffold(
      appBar: MyAppBar(titleText: 'Tratamientos'),
      drawer: MyDrawer(),
      body: Container(
        color: temaActual.temaActual.colorScheme.surface,
        child: Align(
          alignment: Alignment(0, 0),
          child: Container(
            width: 380,
            height: 780,
            padding: const EdgeInsets.all(10),
            //hago un GridView.builder para poder modificar las dimensiones
            //de los contenedores de la lista
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                childAspectRatio: 0.8,
              ),
              itemCount: tratamientos.length,
              itemBuilder: (context, index) {
                //hago un map para recoger los datos de cada tratamiento
                Map<String, dynamic> tratamientoData = tratamientos[index];

                //meto en variables los campos que quiera mostrar
                //en la lista
                int frecuenciaToma = tratamientoData["frecuencia"];
                int dosis = tratamientoData["dosis"];
                int duracion = tratamientoData["duracion_dias"];
                String activo = tratamientoData["activo"];

                //creo un gestureDetector para que se pueda clicar en
                //los registros de la lista
                return GestureDetector(
                    onTap: () {
                      //al clicar en uno de los registros, cambiaré a la pantalla
                      //modificarTratamiento y llevaré los datos del tratamiento
                      //a dicha pantalla
                      final destino = MaterialPageRoute(
                          builder: (_) => ModificarTratamiento(
                              tratamientoData: tratamientoData));
                      Navigator.push(context, destino).then((_) {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.lightGreen,
                      ),
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/paracetamol_caja.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 20)),
                          Text("Frecuencia: $frecuenciaToma horas",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 17,
                              )),
                          Text("Duracion: $duracion dias",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 17,
                              )),
                          Text("Dosis: $dosis",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 17,
                              )),
                          Text("Estado: $activo",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 17,
                              )),
                        ],
                      ),
                    ));
              },
            ),
          ),
        ),
      ),

      //creo un boton para ir a la pantalla de añadir un tratamiento
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final destino = MaterialPageRoute(builder: (_) => CrearTratamiento());
          Navigator.push(context, destino).then((_) {
            _cargarTratamientos();
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.green,
          size: 30,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
