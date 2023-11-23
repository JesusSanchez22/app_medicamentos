

import 'package:app_medicamentos/ventanas/bienvenida.dart';
import 'package:app_medicamentos/ventanas/crear_medicamento2.dart';
import 'package:app_medicamentos/ventanas/login2.dart';
import 'package:app_medicamentos/ventanas/ventana_principal.dart';
import 'package:flutter/material.dart';


class Login1 extends StatelessWidget {

  // divido el login en varias pantallas para hacerlo mas facil al usuario
  // pregunto para quien es la app para distintas funcionalidades futuras

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
                padding: EdgeInsets.only(top: 170),
                child: Text("¿Para quién es",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  
                ),),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0, bottom: 30),
                child: Text("esta aplicación?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  
                ),),
              ),

              Row(
                children: [
                  Column(
                    
                    // hago iconos muy grandes para que sea lo más fácil posible

                    children: [
                      Icon(
                        Icons.person,
                        size: 180,
                        color: Colors.white,
                        ),

                      Center(
                        child: Text(
                          "Para mí",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(
                        Icons.person_add,
                        size: 180,
                        color: Colors.white,
                        ),
                        ),

                      Center(
                        child: Text(
                          "Para otro",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      ),
                      
                    ],
                  )
                  
                  
                  
                ],
              )
              


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
            icon: Icon(Icons.skip_next,color: Colors.green),
            label: "Siguiente"),
        ],

        onTap: (value){
          switch(value){
            case 0:
              final destino = MaterialPageRoute(builder: (_) => Bienvenida());
              Navigator.push(context, destino);
            break;

            
            case 1:
              final destino = MaterialPageRoute(builder: (_) => Login2());
              Navigator.push(context, destino);
            break;
          }
        }

    )
    
    );
  }
}