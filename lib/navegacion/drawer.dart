
import 'package:flutter/material.dart';
import 'package:prueba/screens/pantalla2.dart';
import 'package:prueba/screens/pantalla3.dart';

class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("Ejercicio 1"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Pantalla2())),
          ),
          ListTile(
            title: Text("Ejercicio 2"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Pantalla3())),
          )
        ],
      ),
    );
  }
}