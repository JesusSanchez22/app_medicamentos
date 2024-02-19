import 'package:app_medicamentos/modelos/base_datos.dart';
import 'package:app_medicamentos/modelos/usuario.dart';
import 'package:app_medicamentos/provider/temaProvider.dart';
import 'package:app_medicamentos/provider/userProvider.dart';
import 'package:app_medicamentos/ventanas/ventana_principal.dart';
import 'package:app_medicamentos/widgets/MyAppBar.dart';
import 'package:app_medicamentos/widgets/MyDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//ventana en la que podremos ver y modificar los datos del usuario con
//el que se ha hecho login
class VentanaPerfil extends StatefulWidget {
  @override
  _VentanaPerfilState createState() => _VentanaPerfilState();
}

class _VentanaPerfilState extends State<VentanaPerfil> {
  DBHelper dbHelper = DBHelper();

  //creo un controller para recoger los datos de cada campo
  TextEditingController correoController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController contrasenaController = TextEditingController();
  TextEditingController tipoPerfilController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //llamo a los provider que voy a usar
    //usaré la variable userActual para recoger el usuario
    //que hay en el provider UserProvider (con el que hemos hecho login)
    final userActual = Provider.of<UserProvider>(context);
    final temaActual = Provider.of<TemaProvider>(context);

    //meto en los controller los datos del userActual
    correoController.text = userActual.user.correo;
    nombreController.text = userActual.user.nombre;
    contrasenaController.text = userActual.user.contrasena;
    tipoPerfilController.text = userActual.user.tipo_perfil;

    //meto el id del userActual en una variable
    int? id = userActual.user.id_usuario;

    return Scaffold(
        appBar: const MyAppBar(titleText: 'Perfil'),
        drawer: const MyDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "Datos generales",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                tileColor: temaActual.temaActual.colorScheme.secondary,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: correoController,
                  decoration: InputDecoration(
                    labelText: 'Correo',
                    hintText: 'Introduce tu correo',
                  ),
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: nombreController,
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    hintText: 'Introduce tu nombre',
                  ),
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: contrasenaController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    hintText: 'Introduce tu contraseña',
                  ),
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: tipoPerfilController,
                  decoration: InputDecoration(
                    labelText: 'Tipo de perfil',
                    hintText: '',
                  ),
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //creo un objeto usuario con los datos de los TextFormField
            Usuario usuario = new Usuario(
                id,
                correoController.text,
                nombreController.text,
                contrasenaController.text,
                tipoPerfilController.text);

            //llamo al método para actualizar el usuario de la clase
            //de la base de datos
            dbHelper.updateUsuario(usuario);
            userActual.user = usuario;

            final destino =
                MaterialPageRoute(builder: (_) => VentanaPrincipal());
            Navigator.push(context, destino).then((_) {});
          },
          child: Icon(
            Icons.check,
            color: Colors.green,
            size: 30,
          ),
          backgroundColor: Colors.white,
        ));
  }
}
