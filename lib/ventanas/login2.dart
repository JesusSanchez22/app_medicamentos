

import 'package:app_medicamentos/ventanas/bienvenida.dart';
import 'package:app_medicamentos/ventanas/crear_medicamento2.dart';
import 'package:app_medicamentos/ventanas/login1.dart';
import 'package:app_medicamentos/ventanas/ventana_principal.dart';
import 'package:flutter/material.dart';


class Login2 extends StatelessWidget {

  //pregunto los datos necesarios para el registro

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
                padding: EdgeInsets.only(top: 150),
                child: Text("Introduzca el correo",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  
                ),),
              ),
              SizedBox(
               width: 350,
               height:70,
               child: TextField(
                
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 3),

                  ),
                  
                ),

               ),
             ),
              
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text("Introduzca el nombre",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  
                ),),
              ),
              SizedBox(
               width: 350,
               height:70,
               child: TextField(
                
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 3),

                  ),
                  
                ),

               ),
             ),

             Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text("Introduzca la contraseña",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  
                ),),
              ),
              SizedBox(
               width: 350,
               height:70,
               child: TextField(
                //propiedad para que el texto que escribamos no se vea, para más seguridad
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 3),

                  ),
                  
                ),

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
            icon: Icon(Icons.skip_next,color: Colors.green),
            label: "Siguiente"),
        ],

        onTap: (value){
          switch(value){
            case 0:
              final destino = MaterialPageRoute(builder: (_) => Login1());
              Navigator.push(context, destino);
            break;

            
            case 1:
              final destino = MaterialPageRoute(builder: (_) => VentanaPrincipal());
              Navigator.push(context, destino);
            break;
          }
        }

    )
    
    );
  }
}