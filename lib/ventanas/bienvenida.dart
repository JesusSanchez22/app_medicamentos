

import 'package:app_medicamentos/ventanas/crear_medicamento2.dart';
import 'package:app_medicamentos/ventanas/login1.dart';
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
      color: Colors.white,
      child: Align(
        alignment: Alignment(0,0.5),
          child: Container(
            width: 380, 
            height: 760,
            // decoración para la pantalla
            decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)
            ),
          ),


          child:  DefaultTextStyle(
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          
          //hago un column para poner los distintos elementos en la ventana
          child:  Column(
            children: [
              
              //pongo un texto
              const Padding(
                padding: EdgeInsets.only(top: 200),
                child: Text("Bienvenido a",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  
                ),),
              ),

              //pongo otro texto
              const Padding(
                padding: EdgeInsets.only(top: 0, bottom: 10),
                child: Text("MedicApp",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 80,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  
                ),),
              ),

              //hago el botón dentro de un sized box para poder cambiar el tamaño
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
                  ),
                  onPressed: (){
                    final destino = MaterialPageRoute(builder: (_) => Login1());
                    Navigator.push(context, destino);
                  }, 
                  child: const Text(
                    "Comenzar",
                    style: TextStyle(fontSize: 25),
                  ),
                )
                ),
              


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