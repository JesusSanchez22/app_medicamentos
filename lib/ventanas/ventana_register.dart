import 'package:app_medicamentos/modelos/base_datos.dart';
import 'package:app_medicamentos/modelos/usuario.dart';
import 'package:app_medicamentos/provider/userProvider.dart';
import 'package:app_medicamentos/ventanas/ventanaLoginRegister.dart';
import 'package:app_medicamentos/ventanas/ventana_principal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//ventana para registrarse (crear un usuario)
class VentanaRegister extends StatefulWidget {
  @override
  _VentanaRegisterState createState() => _VentanaRegisterState();
}

class _VentanaRegisterState extends State<VentanaRegister> {
  //mediante controllers, recogeré los datos de cada textField
  TextEditingController _correoController = TextEditingController();
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _contrasenaController = TextEditingController();
  TextEditingController _tipoPerfilController = TextEditingController();

  @override
  void dispose() {
    _correoController.dispose();
    _nombreController.dispose();
    _contrasenaController.dispose();
    _tipoPerfilController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 255, 219),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Registro de Usuario'),
      ),
      //uso un singleChildScrollView para que al entrar en un cuadro de texto
      //la ventana se ajuste al espacio que ocupa el teclado
      //evitando errores por falta de espacio
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: TextField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _correoController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Correo',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _contrasenaController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              //para tipo de perfil sólo quiero tener dos opciones, así que uso un
              //DropdownButtonFormField para dichas opciones
              //según la opción escogida el valor será uno u otro
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                  labelText: 'Tipo de perfil',
                  hintText: 'Introduce el tipo de perfil',
                ),
                items: const [
                  DropdownMenuItem(
                    value: "Personal",
                    child: Text("Personal"),
                  ),
                  DropdownMenuItem(
                    value: "Gestion",
                    child: Text("Gestión de terceros"),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    _tipoPerfilController.text = value;
                  } else {
                    _tipoPerfilController.text = "Personal";
                  }
                },
                onSaved: (value) {
                  if (value != null) {
                    _tipoPerfilController.text = value;
                  } else {
                    _tipoPerfilController.text = "Personal";
                  }
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: () async {
                //al presionar el botón recogemos todos los datos y nos aseguramos
                //de que no haya ningún campo vacío antes de crear el usuario
                String correo = _correoController.text;
                String nombre = _nombreController.text;
                String contrasena = _contrasenaController.text;
                String tipoPerfil = _tipoPerfilController.text;

                if (nombre.isNotEmpty &&
                    correo.isNotEmpty &&
                    contrasena.isNotEmpty &&
                    tipoPerfil.isNotEmpty) {
                  //Creamos el objeto Usuario
                  Usuario usuario =
                      Usuario.withoutId(correo, nombre, contrasena, tipoPerfil);

                  //lo insertamos en la base de datos
                  int result = await DBHelper().insertUsuario(usuario);

                  //controlamos que se haya creado correctamente
                  if (result > 0) {
                    print('Usuario registrado correctamente');

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => VentanaLoginRegister()));
                  } else {
                    print('Error al registrar usuario');

                    //con un showdialog mostramos un error en caso de que no se haya podido
                    //crear el usuario
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Error'),
                        content: Text('No se pudo registrar el usuario.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Aceptar'),
                          ),
                        ],
                      ),
                    );
                  }
                } else {
                  // Mostrar mensaje de error si algún campo está vacío
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Por favor, complete todos los campos.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Aceptar'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
