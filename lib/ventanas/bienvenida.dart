import 'package:app_medicamentos/ventanas/ventanaLoginRegister.dart';
import 'package:app_medicamentos/ventanas/ventana_principal.dart';
import 'package:flutter/material.dart';

//clase que nos dará la bienvenida
class Bienvenida extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //==================== AppBar ===========================

      //==================== Body ===========================

      body: Container(
        color: Color.fromARGB(255, 247, 255, 219),
        child: Align(
          alignment: Alignment(0, 0.5),
          child: Container(
            width: 380,
            height: 760,
            // decoración para la pantalla

            child: DefaultTextStyle(
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),

              //hago un column para poner los distintos elementos en la ventana
              child: Column(
                children: [
                  //pongo un texto
                  const Padding(
                    padding: EdgeInsets.only(top: 200),
                    child: Text(
                      "Bienvenido a",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  //pongo otro texto
                  const Padding(
                    padding: EdgeInsets.only(top: 0, bottom: 10),
                    child: Text(
                      "MedicApp",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 80,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  //hago el botón dentro de un sized box para poder cambiar el tamaño
                  SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.lightGreen),
                        ),
                        onPressed: () {
                          final destino = MaterialPageRoute(
                              builder: (_) => VentanaLoginRegister());
                          Navigator.push(context, destino);
                        },
                        child: const Text(
                          "Comenzar",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),

      //==================== Menú inferior ===========================
    );
  }
}
