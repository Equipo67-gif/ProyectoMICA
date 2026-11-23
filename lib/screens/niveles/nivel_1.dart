import 'package:flutter/material.dart';
import 'package:main/screens/resultado_page.dart';

class Nivel1Page extends StatefulWidget {
  const Nivel1Page({super.key});

  @override
  State<Nivel1Page> createState() => _Nivel1PageState();
}

class _Nivel1PageState extends State<Nivel1Page> {
  final List<Map<String, dynamic>> preguntas = [
    {
      "pregunta":
          "¿En qué año comenzó la pandemia de gripe española?",
      "opciones": ["1930", "1925", "1900", "1918",],
      "respuesta": "1918",
    },
    {
      "pregunta":
          "¿En donde se dio el primer aviso del brote?",
      "opciones": ["E.U, Kansas", "España, Madrid", "Paris, Francia", "Stalingrado, Rusia",],
      "respuesta": "E.U, Kansas",
    },
    {
      "pregunta":
          "Este es un subtipo del virus. ¿Cual es su nombre cientifico del virus original?",
      "opciones": [
        "Lissavirus",
        "H1N1",
        "Variola virus",
        "Vibrio Choleare",
      ],
      "respuesta":
          "H1N1",
    },
    {
      "pregunta":
          "¿A que tipo categoria entra este tipo de enfermedad?",
      "opciones": [
        "Influenza C",
        "Influenza D",
        "Influenza B",
        "influenza A",
      ],
      "respuesta":
          "influenza A",
    },
    {
      "pregunta":
          "¿A que familia pertenece?",
      "opciones": [
        "Adenoviridae",
        "Picornaviriade",
        "Bornaviriade",
        "Orthomyxoviridae",
      ],
      "respuesta": "Orthomyxoviridae",
    },
    {
      "pregunta":
          "¿sintomas comunes?",
      "opciones": [
       "Fiebre alta, escalofrios, tos, cansancio excesivo",
        "Abcesos, hemorragia interna, inflamacion, ceguera",
        "Alucinaciones, caries, diarrea, hipertension",
        "Neumonia, migraña, paralisis",
      ],
      "respuesta": "Fiebre alta, escalofrios, tos, cansancio excesivo",
    },
    {
      "pregunta":
          "¿Cual es la forma mas eficaz de evitar el contagio?",
      "opciones": ["enfermarse para crear los anticuerpos", "evitar comer caldo de iguana", "Vacunacion anual", "higiene extrema"],
      "respuesta": "Vacunacion anual",
    },
    {
      "pregunta":
          "¿Como es su contagio?",
      "opciones": ["Gotitas, contacto directo", "pus, sangre contaminada", "45, 67", "alimentos mal lavados, carne en putrefaccion"],
      "respuesta": "Gotitas, contacto directo",
    },
  ];

  int preguntaActual = 0;
  int respuestasCorrectas = 0;
  List<Map<String, dynamic>> resultados = [];

  void responder(String opcion) {

  bool esCorrecta =
      opcion == preguntas[preguntaActual]["respuesta"];

  if (esCorrecta) {
    respuestasCorrectas++;
  }

  resultados.add({
    "pregunta": preguntas[preguntaActual]["pregunta"],
    "respuestaJugador": opcion,
    "respuestaCorrecta":
        preguntas[preguntaActual]["respuesta"],
    "correcta": esCorrecta,
  });

  if (preguntaActual < preguntas.length - 1) {
    setState(() {
      preguntaActual++;
    });
  } else {
    mostrarResultado();
  }
}

  void mostrarResultado() {
    int incorrectas =
        preguntas.length - respuestasCorrectas;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultadoPage(
          correctas: respuestasCorrectas,
          incorrectas: incorrectas,
          resultados: resultados,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pregunta = preguntas[preguntaActual];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pregunta ${preguntaActual + 1}/${preguntas.length}",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            LinearProgressIndicator(
              value:
                  (preguntaActual + 1) /
                  preguntas.length,
            ),

            const SizedBox(height: 30),

            Text(
              pregunta["pregunta"],
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            ...(pregunta["opciones"] as List<String>)
                .map(
                  (opcion) => Padding(
                    padding:
                        const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () =>
                            responder(opcion),
                        child: Text(opcion),
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}


 