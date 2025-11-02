import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../componentes/visor.dart';
import '../componentes/teclado.dart';
import '../modelos/memoria.dart';

class Calculatora extends StatefulWidget {
  const Calculatora({super.key});

  @override
  State<Calculatora> createState() => _CalculatoraState();
}

class _CalculatoraState extends State<Calculatora> {
  final Memoria memoria = Memoria();

  void _pressionado(String comando) {
    if (kDebugMode) {
      // Mostra no console qual tecla foi pressionada (util para depuracao inicial).
      // Comentario sem acentuacao para evitar problemas de encoding.
      print('Tecla: $comando');
    }
    setState(() {
      memoria.tratarDigito(comando);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFE6E6E6),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Visor(memoria.valorNoVisor),
                const SizedBox(height: 8),
                Teclado(_pressionado),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
