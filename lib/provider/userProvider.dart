//provider que sirve para guardar los datos del usuario con el
//que iniciemos sesión, y que luego se recogerán en la
//ventana de perfil de usuario
import 'package:app_medicamentos/modelos/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  late Usuario _user;

  UserProvider() {
    _user = Usuario(null, "", "", "", "");
  }

  Usuario get user => this._user;

  set user(Usuario user) {
    this._user = user;
    notifyListeners();
  }
}
