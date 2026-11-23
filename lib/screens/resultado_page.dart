
import 'package:flutter/material.dart';

class ResultadoPage extends StatefulWidget {
  final int correctas;
  final int incorrectas;
  final List<Map<String, dynamic>> resultados;

  const ResultadoPage({
    super.key,
    required this.correctas,
    required this.incorrectas,
    required this.resultados,
  });

  @override
  State<ResultadoPage> createState() => _ResultadoPageState();
}

class _ResultadoPageState extends State<ResultadoPage> {
  bool mostrarRevision = false;

 
  double obtenerPorcentaje() {
    int total = widget.correctas + widget.incorrectas;

    if (total == 0) {
      return 0;
    }

    return (widget.correctas / total) * 100;
  }

  String obtenerMensaje() {
    double porcentaje = obtenerPorcentaje();

    if (porcentaje >= 90) {
      return "Bien trabajo pije, te mando beso en el siempre sucio";
    } else if (porcentaje >= 70) {
      return "No es muy God, minimo no chillas por sacar un 95 en calificaciones";
    } else if (porcentaje >= 50) {
      return "Ponte a investigar o te voy tocar al estilo Epstein";
    } else {
      return "Ja, que perdedor y haganle bullyng hasta que se su1c1d3";
    }
  }

 List<String> obtenerImagenes() {
  double porcentaje = obtenerPorcentaje();

  if (porcentaje >= 90) {
    return [
      "assets/finales/excelente1.png",
      "assets/finales/excelente2.gif",
      "assets/finales/excelente3.png",
    ];
  }

  if (porcentaje >= 70) {
    return [
      "assets/finales/bien1.png",
      "assets/finales/bien2.png",
      "assets/finales/bien3.gif"
    ];
  }

  if (porcentaje >= 50) {
    return [
      "assets/finales/regular1.gif",
      "assets/finales/regular2.png",
    ];
  }

  return [
    "assets/finales/malo1.png",
    "assets/finales/malo2.png",
  ];
}

  @override
  Widget build(BuildContext context) {
    double porcentaje = obtenerPorcentaje();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Resultados"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            "¡Nivel completado!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          // Porcentaje
          Text(
            "Porcentaje obtenido: ${porcentaje.toStringAsFixed(1)}%",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),

          const SizedBox(height: 20),

          
         Center(
          child: Column(
             children: obtenerImagenes().map((ruta) {
               return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Image.asset(
                      ruta,
                height: 150,
                  fit: BoxFit.contain,
             ),
               );
              }).toList(),
            ),
           ),
           
          const SizedBox(height: 15),

          
          Text(
            obtenerMensaje(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 25),

          Text(
            "✅ Correctas: ${widget.correctas}",
            style: const TextStyle(
              fontSize: 24,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            "❌ Incorrectas: ${widget.incorrectas}",
            style: const TextStyle(
              fontSize: 24,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          // Botón para revisar respuestas
          ElevatedButton(
            onPressed: () {
              setState(() {
                mostrarRevision = !mostrarRevision;
              });
            },
            child: Text(
              mostrarRevision
                  ? "Ocultar respuestas"
                  : "Ver respuestas",
            ),
          ),

          const SizedBox(height: 20),

          // Revisión de respuestas
          if (mostrarRevision)
            ...widget.resultados.map((resultado) {
              return Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        resultado["pregunta"],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        resultado["correcta"]
                            ? "✅ Correcta"
                            : "❌ Incorrecta",
                        style: TextStyle(
                          color: resultado["correcta"]
                              ? Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        "Tu respuesta: ${resultado["respuestaJugador"]}",
                      ),

                      Text(
                        "Respuesta correcta: ${resultado["respuestaCorrecta"]}",
                      ),
                    ],
                  ),
                ),
              );
            }),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Volver"),
          ),
        ],
      ),
    );
  }
}