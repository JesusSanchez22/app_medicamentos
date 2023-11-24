
import 'package:app_medicamentos/ventanas/crear_medicamento.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class VentanaPrincipal extends StatelessWidget {
  const VentanaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      //Me falta usar un drawer, o endDrawer, que según el diseño que tenia pensado no les veía mucho sentido
      //en el futuro si añado más funcionalidades se puede pensar

      //==================== AppBar ===========================
   

    //==================== Body ===========================

    body: Container(
      color: Colors.white,
      child: Align(
        alignment: Alignment(0, 0),
        child: Container(
          width: 380, 
          height: 780,
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

          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 20),
                child: Text(
                  "MedicApp",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                  ),
                ),
              ),

              
              //boton para reponer medicamentos, nos llevará a la farmacia más cercana
              //de momento no nos toca hacer eso, asi que no nos redirige a nada
              Center(
                child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lightGreen)),
                onPressed: (){}, 
                child: 
                const Text(
                  "Reponer medicamentos",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15
                  ),
                  ),
                )
                ),


              //list view vertical para ver cuanto podemos estar sin medicamentos
              Expanded(

                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 8),
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0)
                          ),

                          //los medicamentos que estén cerca de acabarse aparecerán en rojo
                        color: Colors.redAccent,
                      ),
                      height: 50,
                      child: const Align(
                        alignment: Alignment(0, 0),
                        child: Text(
                          "Paracetamol              Reponer antes de: 2 días",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15
                            ),
                          
                          ),
                        )
                    ),
                    Container(
                      height: 50,
                      color: Colors.lightGreen,
                      child: const Align(
                        alignment: Alignment(0, 0),
                        child: Text(
                          "Ibuprofeno              Existencias hasta: 20 días",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15
                            ),
                          
                          ),
                        )
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        // los que falta bastante para que se acaben estarán en verde
                        color: Colors.lightGreen,
                      ),
                      height: 50,
                      child: const Align(
                        alignment: Alignment(0, 0),
                        child: Text(
                          "Dormidina              Existencias hasta: 30 días",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15
                            ),
                          
                          ),
                        )
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        
                        color: Colors.redAccent,
                      ),
                      height: 50,
                      child: const Align(
                        alignment: Alignment(0, 0),
                        child: Text(
                          "Simvastatina              Reponer antes de: 12 horas",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15
                            ),
                          
                          ),
                        )
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        
                        color: Colors.redAccent,
                      ),
                      height: 50,
                      child: const Align(
                        alignment: Alignment(0, 0),
                        child: Text(
                          "Aspirina              Reponer antes de: 1 semana",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15
                            ),
                          
                          ),
                        )
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        
                        color: Colors.lightGreen,
                      ),
                      height: 50,
                      child: const Align(
                        alignment: Alignment(0, 0),
                        child: Text(
                          "Omeprazol              Existencias hasta: 22 días",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15
                            ),
                          
                          ),
                        )
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        
                        color: Colors.lightGreen,
                      ),
                      height: 50,
                      child: const Align(
                        alignment: Alignment(0, 0),
                        child: Text(
                          "Lexotiroxina              Existencias hasta: 15 días",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15
                            ),
                          
                          ),
                        )
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0)
                          ),
                        color: Colors.redAccent,
                      ),
                      height: 50,
                      child: const Align(
                        alignment: Alignment(0, 0),
                        child: Text(
                          "Ramipril              Reponer antes de: 30 minutos",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15
                            ),
                          
                          ),
                        )
                    ),
                    
                  ],
              ),
              ),


              //list view horizontal para mostrar las proximas consumiciones, y las que ya han sucedido

              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(
                    bottom: 0,
                    top: 30,
                  ),
                  scrollDirection: Axis.horizontal,
                  children: [
                      Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          bottomLeft: Radius.circular(12.0)
                          ),
                        color: Colors.lightGreen,
                      ),
                      width: 200,
                      child: Align(
                        alignment: Alignment(0, 0),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 25),
                              child: Text(
                                "Dormidina",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                  decoration: TextDecoration.underline
                                  ),
                                ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 15, left: 5, right: 5, bottom: 10),
                              child: Text(
                                //las que todavia no se hayan consumido aparecerán en verde
                                "Próxima consumición en:\n 2 horas",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 15
                                  ),
                                ),
                            ),
                            
                            Center(
                              //boton para indicar si lo he tomado o no 
                              child: TextButton(
                                style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all
                                (Colors.white)),
               
                              onPressed: () {  },
                              child: 
                              const Text(
                                "Ya lo he tomado",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontSize: 15
                                ),
                                ),
                              )
                              ),
                            
                            const Row(
                              children: [
                                Padding(
                                  padding:EdgeInsets.only(left: 20, top : 15),
                                  child: Image(
                                    image: AssetImage('assets/dormidina_caja.jpg'),
                                  ),
                                ),
                                Padding(
                                  padding:EdgeInsets.only(left: 10, top : 15),
                                  child: Image(
                                    image: AssetImage('assets/dormidina.jpg'),
                                  ),
                                ),
                              ],
                            )
                            
                            

                          ],
                        )
                        )
                       ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          
                          ),
                          // las que se tenian que haber consumido, pero no se ha hecho
                          //aparecerán en rojo
                        color: Colors.redAccent,
                      ),
                      width: 200,
                      child: Align(
                        alignment: Alignment(0, 0),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 25),
                              child: Text(
                                "Paracetamol",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                  decoration: TextDecoration.underline
                                  ),
                                ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 0, left: 5, right: 15, bottom: 0),
                              child: Text(
                                "No se consumió hace: \n 30 minutos",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 15
                                  ),
                                ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 0, left: 5, right: 15, bottom: 5),
                              child: Text(
                                "Próxima consumición en: \n 20 minutos",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 15
                                  ),
                                ),
                            ),
                            
                            Center(
                              child: TextButton(
                                style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all
                                (Colors.white)),
               
                              onPressed: () {  },
                              child: 
                              const Text(
                                "Ya lo he tomado",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontSize: 15
                                ),
                                ),
                              )
                              ),
                            
                            const Row(
                              //fotos de la caja y las pastillas, para más facilidad
                              children: [
                                Padding(
                                  padding:EdgeInsets.only(left: 20, top : 5),
                                  child: Image(
                                    image: AssetImage('assets/paracetamol_caja.jpg'),
                                  ),
                                ),
                                Padding(
                                  padding:EdgeInsets.only(left: 10, top : 5),
                                  child: Image(
                                    image: AssetImage('assets/paracetamol.jpg'),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                        )
                       ),

                       Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0)
                          ),
                        color: Colors.lightGreen,
                      ),
                      width: 200,
                      child: Align(
                        alignment: Alignment(0, 0),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 25),
                              child: Text(
                                "Ibuprofeno",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                  decoration: TextDecoration.underline
                                  ),
                                ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 15, left: 5, right: 5, bottom: 10),
                              child: Text(
                                "Próxima consumición en:\n 1 día",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 15
                                  ),
                                ),
                            ),
                            
                            Center(
                              child: TextButton(
                                style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all
                                (Colors.white)),
               
                              onPressed: () {  },
                              child: 
                              const Text(
                                "Ya lo he tomado",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontSize: 15
                                ),
                                ),
                              )
                              ),
                            
                            const Row(
                              children: [
                                Padding(
                                  padding:EdgeInsets.only(left: 20, top : 15),
                                  child: Image(
                                    image: AssetImage('assets/ibuprofeno_caja.jpg'),
                                  ),
                                ),
                                Padding(
                                  padding:EdgeInsets.only(left: 10, top : 15),
                                  child: Image(
                                    image: AssetImage('assets/ibuprofeno.jpg'),
                                  ),
                                ),
                              ],
                            )
                            
                            

                          ],
                        )
                        )
                       ),
                    
                  ],
                )
              ),

              
            ],
          )


          
        ),
        )
    ),

    //==================== FloatingButton ===========================
    //boton flotante para agregar medicamentos
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        final destino = MaterialPageRoute(builder: (_) => CrearMedicamento());
          Navigator.push(context, destino);
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