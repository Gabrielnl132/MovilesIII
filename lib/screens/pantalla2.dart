import 'package:flutter/material.dart';

class Pantalla2 extends StatefulWidget {
  const Pantalla2({super.key});

  @override
  _Pantalla2State createState() => _Pantalla2State();
}

class _Pantalla2State extends State<Pantalla2> {
  final TextEditingController _initialHeightController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  void _calculateHeight() {
    final double initialHeight = double.tryParse(_initialHeightController.text) ?? 0.0;
    final double time = double.tryParse(_timeController.text) ?? 0.0;
    const double acceleration = 20.0; 

    final double height = initialHeight + 0.5 * acceleration * time * time;
    String resultMessage;

    if (height < 1000) {
      resultMessage = 'Lanzamiento fallido. Altura alcanzada: ${height.toStringAsFixed(2)} m';
    } else {
      resultMessage = 'Lanzamiento exitoso. Altura alcanzada: ${height.toStringAsFixed(2)} m';
    }

    _showResultDialog(resultMessage);
  }

  void _showResultDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Resultado'),
          content: Text(message),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio 1"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://i.pinimg.com/736x/75/24/1c/75241c71ac62a89022f4b53c1363fa91.jpg', // Reemplaza con tu URL de imagen
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black54, // Fondo semi-transparente para mayor legibilidad
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _initialHeightController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Altura inicial (hi) en metros',
                    labelStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(color: Colors.amber),
                    ),
                    filled: true,
                    fillColor: Colors.black38,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _timeController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Tiempo (t) en segundos',
                    labelStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(color: Colors.amber),
                    ),
                    filled: true,
                    fillColor: Colors.black38,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _calculateHeight,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber, // Cambiado de primary a backgroundColor
                    foregroundColor: Colors.black, // Cambiado de onPrimary a foregroundColor
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text('Calcular Altura'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
