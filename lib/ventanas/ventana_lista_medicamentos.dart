import 'package:app_medicamentos/modelos/base_datos.dart';
import 'package:app_medicamentos/modelos/medicamento.dart';
import 'package:app_medicamentos/provider/temaProvider.dart';
import 'package:app_medicamentos/ventanas/modificar_medicamento.dart';
import 'package:app_medicamentos/widgets/MyAppBar.dart';
import 'package:app_medicamentos/widgets/MyDrawer.dart';
import 'package:app_medicamentos/ventanas/crear_medicamento.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//ventana en la que aparecerán la lista de medicamentos
class Ventana_lista_medicamentos extends StatefulWidget {
  @override
  _VentanaListaMedicamentosState createState() =>
      _VentanaListaMedicamentosState();
}

class _VentanaListaMedicamentosState extends State<Ventana_lista_medicamentos> {
  DBHelper dbHelper = DBHelper();
  //creo una lista en la que meteré los medicamentos
  late List<Map<String, dynamic>> medicamentos = [];

  //cargo el metodo cargarMedicamentos la iniciar la ventana
  @override
  void initState() {
    super.initState();
    _cargarMedicamentos();
  }

  //uso un método para recoger los medicamentos desde la base de datos
  //y los meto en la lista que he creado antes
  Future<void> _cargarMedicamentos() async {
    medicamentos = await dbHelper.getMedicamentos();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final temaActual = Provider.of<TemaProvider>(context);
    return Scaffold(
      appBar: MyAppBar(titleText: 'Medicamentos'),
      drawer: MyDrawer(),
      body: Container(
        color: temaActual.temaActual.colorScheme.surface,
        child: Align(
          alignment: Alignment(0, 0),
          child: Container(
            width: 380,
            height: 780,
            padding: const EdgeInsets.all(10),
            //uso un gridview builder para poder modificar las dimensiones de
            //cada registro de la lista
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                childAspectRatio: 1,
              ),
              itemCount: medicamentos.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> medicamentoData = medicamentos[index];

                //uso el GestureDetector para poder clicar sobre cada registro
                //de la lista
                return GestureDetector(
                    onTap: () {
                      //al pulsar sobre uno de los medicamentos, nos llevará
                      //a la ventana de modificar medicamentos, con los
                      //datos del medicamento que hayamos clicado
                      final destino = MaterialPageRoute(
                          builder: (_) => ModificarMedicamento(
                              medicamentoData: medicamentoData));
                      Navigator.push(context, destino).then((_) {
                        _cargarMedicamentos();
                      });
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue,
                        ),
                        margin: const EdgeInsets.all(5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            "assets/paracetamol_caja.jpg",
                            fit: BoxFit.fill,
                          ),
                        )));
              },
            ),
          ),
        ),
      ),

      //creo un botón para poder ir a la ventana para crear
      //medicamentos
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final destino = MaterialPageRoute(builder: (_) => CrearMedicamento());
          Navigator.push(context, destino).then((_) {
            _cargarMedicamentos();
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
