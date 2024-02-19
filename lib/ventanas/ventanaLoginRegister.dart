import 'package:app_medicamentos/modelos/base_datos.dart';
import 'package:app_medicamentos/modelos/usuario.dart';
import 'package:app_medicamentos/provider/userProvider.dart';
import 'package:app_medicamentos/ventanas/ventana_register.dart';
import 'package:app_medicamentos/ventanas/ventana_principal.dart';
import 'package:app_medicamentos/widgets/percent_progress_indicator_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//ventana para introducir los datos para logear
class VentanaLoginRegister extends StatelessWidget {
  final dbHelper = DBHelper();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //creamos una variable para almacenar los datos del usuario con el que hagamos login
    //en el provider userProvider
    final userActual = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 247, 255, 219),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 380,
            height: 710,
            child: DefaultTextStyle(
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: Text(
                      "Iniciar Sesión",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 350,
                    height: 70,
                    child: TextField(
                      //mediante controllers recogemos los datos de cada campo
                      controller: _correoController,
                      decoration: InputDecoration(
                        labelText: 'Correo',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 3),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 350,
                    height: 70,
                    child: TextField(
                      controller: _contrasenaController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 3),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () async {
                      String correo = _correoController.text;
                      String contrasena = _contrasenaController.text;

                      //verificamos que la contraseña es la adecuada al correo
                      bool credencialesCorrectas = await DBHelper()
                          .verificarCredenciales(correo, contrasena);

                      if (credencialesCorrectas) {
                        //controlamos que el correo que hemos introducido exista
                        Usuario? usuario =
                            await dbHelper.verificarUsuarioExiste(correo);

                        if (usuario != null) {
                          userActual.user = usuario;

                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => VentanaPrincipal()),
                          );
                        }
                      } else {
                        //uso un showDialog para mostrar por pantalla un mensaje indicando que
                        //algo en las credenciales está mal
                        // ignore: use_build_context_synchronously
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Error"),
                                content:
                                    Text("Correo o contraseña incorrectos"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Aceptar"),
                                  )
                                ],
                              );
                            });
                      }
                    },
                    child: Text('Iniciar Sesión'),
                  ),
                  const SizedBox(height: 20),
                  //hago un botón para poder ir a la ventana de registro en caso de
                  //no tener cuenta creada
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => VentanaRegister()),
                      );
                    },
                    child: Text('¿No tienes una cuenta? Regístrate aquí'),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
