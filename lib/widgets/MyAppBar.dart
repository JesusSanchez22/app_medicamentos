import 'package:flutter/material.dart';

//app bar personalizada que permitirá introducir un título
//para cada pantalla
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;

  const MyAppBar({Key? key, required this.titleText})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      iconTheme: IconThemeData(color: Colors.white, size: 40),
      title: Text(
        titleText,
        style: TextStyle(
          fontSize: 25,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
