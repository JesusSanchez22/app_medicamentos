

import 'package:app_medicamentos/ventanas/crear_medicamento.dart';
import 'package:app_medicamentos/ventanas/crear_medicamento2.dart';
import 'package:app_medicamentos/ventanas/ventana_principal.dart';
import 'package:flutter/material.dart';


class CrearMedicamento3 extends StatelessWidget {

  List<String> items = ['Item1', 'Item2'];
  String? selectedItem = 'Item1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //==================== AppBar ===========================
    appBar: AppBar(
      backgroundColor: Colors.green,
      actions: [
          IconButton(
            onPressed: (){
              final destino = MaterialPageRoute(builder: (_) => VentanaPrincipal());
              Navigator.push(context, destino);
            }, 
            icon: Icon(Icons.home))
        ],
      ),

    //==================== Body ===========================

    body: Container(
      child: DefaultTextStyle(
        style: const TextStyle(),
        child: Center(
          child: Container(
            padding: const EdgeInsets.only(
                  left: 15, 
                  top: 15, 
                  bottom: 30, 
                  right: 15),
          child:  const DefaultTextStyle(
          style: TextStyle(
            color: Colors.grey,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          child:  Column(
            children: [

              Center(
                child: Text("Agregar medicamento",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  
                ),),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: Text("Otras características",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  
                ),),
              ),
             
             TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
             ),

              // child: DropdownButton<String>(
              //    value: selectedItem,
              //    items: items.map((item) => DropdownMenuItem<String>(
              //     value: item, child: Text(item, style: TextStyle(fontSize: 24))))
              //     .toList(),
              //    onChanged: (value) {
                    
              //     },
              //   )
           
            ],
            ),
        ),
          ),
          
          
          
        ),
        ),
        
    ),

    //==================== Menú inferior ===========================

    bottomNavigationBar: BottomNavigationBar(items: const [
          //no se pueden pasar widgets, sino elementos de la clase bottonNavigationBarItem
          BottomNavigationBarItem(
            //ajuste del icono del boton inferior
            icon: Icon(Icons.skip_previous),
            label: "Atrás",
            
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: "Guardar"),
        ],

        onTap: (value){
          switch(value){
            case 0:
              final destino = MaterialPageRoute(builder: (_) => CrearMedicamento2());
              Navigator.push(context, destino);
            break;

            case 1:

            break;
          }
        }

    )
    );
  }
}