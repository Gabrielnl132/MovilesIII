import 'package:flutter/material.dart';
import 'package:prueba/navegacion/drawer.dart';
import 'package:prueba/screens/pantalla2.dart';

void main() {
  runApp(const Pantalla1());
}

class Pantalla1 extends StatelessWidget {
  const Pantalla1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 1'),
        backgroundColor: Colors.blue,
      ),
      drawer: const MiDrawer(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://i.pinimg.com/originals/b5/2a/19/b52a199a2ad77ba3c83b73db91851223.jpg'), // Reemplaza con el enlace de la imagen
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Gabriel Lucero",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Usuario GITHUB: ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
              const Text(
                "Gabrielnl132",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => navegar02(context),
                child: const Text('Ir a Pantalla 2'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void navegar02(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Pantalla2()),
  );
}
