

import 'package:app_medicamentos/ventanas/crear_medicamento.dart';
import 'package:app_medicamentos/ventanas/crear_medicamento2.dart';
import 'package:app_medicamentos/ventanas/ventana_principal.dart';
import 'package:flutter/material.dart';


class CrearMedicamento2 extends StatelessWidget {

  List<String> items = ['Item1', 'Item2'];
  String? selectedItem = 'Item1';

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
            height: 710,

            decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)
            ),
          ),


          child:  const DefaultTextStyle(
          style: TextStyle(
            color: Colors.grey,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          
          child:  Column(
            children: [

              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text("Agregar medicamento",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  
                ),),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 70, bottom: 10),
                child: Text("¿Cada cuánto debe tomar el medicamento?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  
                ),),
              ),
             
             Padding(
               padding: EdgeInsets.symmetric(horizontal: 30),
               child: TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide :BorderSide(color: Colors.white, width: 3)),
                ),
                keyboardType: TextInputType.number,
               ),
             ),

              
           
            ],
            ),
        ),
          ),
          
          
          
        
        ),
        
    ),

    //==================== Menú inferior ===========================

    bottomNavigationBar: BottomNavigationBar(
    
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: Colors.green,
      selectedItemColor: Colors.green,
      
      items: const [
          //no se pueden pasar widgets, sino elementos de la clase bottonNavigationBarItem
          BottomNavigationBarItem(
            //ajuste del icono del boton inferior
            icon: Icon(Icons.skip_previous,color: Colors.green),
            label: "Atrás",
            

            ),
            BottomNavigationBarItem(
            //ajuste del icono del boton inferior
            icon: Icon(
              Icons.home,
              color: Colors.green,
              ),
            label: "Inicio",
            
            
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.skip_next,color: Colors.green),
            label: "Siguiente"),
        ],

        onTap: (value){
          switch(value){
            case 0:
              final destino = MaterialPageRoute(builder: (_) => CrearMedicamento());
              Navigator.push(context, destino);
            break;

            case 1:
              final destino = MaterialPageRoute(builder: (_) => VentanaPrincipal());
              Navigator.push(context, destino);
            break;
            
            
            break;
          }
        }

    )
    );
  }
}