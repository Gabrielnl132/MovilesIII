import 'package:flutter/material.dart';

class Pantalla3 extends StatefulWidget {
  const Pantalla3({super.key});

  @override
  _Pantalla3State createState() => _Pantalla3State();
}

class _Pantalla3State extends State<Pantalla3> {
  final _controller = TextEditingController();
  double? _theta;

  void _calcularDistancia() {
    final w = double.tryParse(_controller.text);
    if (w != null) {
      final t = 25.0;
      setState(() {
        _theta = w * t;
      });
      _mostrarResultado('La distancia recorrida (θ) es: $_theta radianes');
    } else {
      setState(() {
        _theta = null;
      });
      _mostrarResultado('Por favor, ingrese un valor válido para la velocidad angular.');
    }
  }

  void _mostrarResultado(String mensaje) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Resultado'),
          content: Text(mensaje),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio 2"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQJmK7O-7dbR4eWY8NVcRk0z6wbONfKoeOxQ&s', // Reemplaza con la URL de tu imagen de fondo
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Calculadora de Distancia Recorrida en un Carrusel",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.white70, // Fondo blanco semi-transparente para mayor legibilidad
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Velocidad angular (rad/s)',
                    filled: true,
                    fillColor: Colors.white70, // Fondo blanco semi-transparente para mayor legibilidad
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _calcularDistancia,
                  child: const Text('Calcular Distancia'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
