import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_medicamentos/provider/userProvider.dart';
import 'package:app_medicamentos/ventanas/ventana_perfil.dart';
import 'package:app_medicamentos/rutas/rutas.dart'; // Importa las rutas

//drawer personalizado que usará las rutas de la clase rutas
//para facilitar la navegación entre pantallas en la app
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            child: const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.account_circle,
                    size: 120,
                    color: Colors.green,
                  )),
            ),
          ),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const Divider(
                color: Colors.green,
              ),
              itemCount: rutasPaginas.length,
              itemBuilder: (context, index) => ListTile(
                leading: Icon(
                  rutasPaginas[index].icono,
                  color: Colors.green,
                ),
                title: Text(
                  rutasPaginas[index].titulo,
                  style: const TextStyle(
                    color: Colors.green,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => rutasPaginas[index].pagina,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
