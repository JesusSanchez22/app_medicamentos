import 'package:flutter/material.dart';

//scaffold personalizado que servirá
//para una mayor personalización y eficiencia del código
//en un futuro
class MyScaffold extends StatelessWidget {
  final Widget body;

  MyScaffold(
      {required this.body, required BottomNavigationBar bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: "Siguiente"),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: "Siguiente")
        ],
      ),
    );
  }
}
