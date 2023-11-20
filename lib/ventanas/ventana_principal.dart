
import 'package:app_medicamentos/ventanas/crear_medicamento.dart';
import 'package:flutter/material.dart';


class VentanaPrincipal extends StatelessWidget {
  const VentanaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //==================== AppBar ===========================
   

    //==================== Body ===========================

    body: Container(
      color: Colors.white,
      child: Align(
        alignment: Alignment(0, -0.7),
        child: Container(
          width: 300, 
          height: 150,
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: const Center(
            child: Text(
              "MedicApp",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
          )
        ),
        )
    ),

    //==================== FloatingButton ===========================

    floatingActionButton: FloatingActionButton(
      onPressed: (){
        final destino = MaterialPageRoute(builder: (_) => CrearMedicamento());
          Navigator.push(context, destino);
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.green,
    ),

    );

    
  }
}