import 'package:app_medicamentos/ventanas/ventana_principal.dart';
import 'package:flutter/material.dart';
import 'package:app_medicamentos/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const VentanaPrincipal(),
    );
  }
}

// Expanded(

//                 child: ListView(
//                   children: [
//                     Container(
//                       decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(12.0),
//                           topRight: Radius.circular(12.0)
//                           ),
//                         color: Colors.redAccent,
//                       ),
//                       height: 50,
//                       child: const Align(
//                         alignment: Alignment(0, 0),
//                         child: Text(
//                           "Paracetamol              Reponer antes de: 2 días",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                             fontSize: 15
//                             ),
                          
//                           ),
//                         )
//                     ),
//                     Container(
//                       height: 50,
//                       color: Colors.lightGreen,
//                       child: const Align(
//                         alignment: Alignment(0, 0),
//                         child: Text(
//                           "Ibuprofeno              Existencias hasta: 20 días",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                             fontSize: 15
//                             ),
                          
//                           ),
//                         )
//                     ),
//                     Container(
//                       decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(12.0),
//                           bottomRight: Radius.circular(12.0)
//                           ),
//                         color: Colors.lightGreen,
//                       ),
//                       height: 50,
//                       child: const Align(
//                         alignment: Alignment(0, 0),
//                         child: Text(
//                           "Dormidina              Existencias hasta: 30 días",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                             fontSize: 15
//                             ),
                          
//                           ),
//                         )
//                     ),
                    
//                   ],
//               ),

              
//               )

