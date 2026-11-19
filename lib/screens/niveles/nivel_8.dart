import 'package:flutter/material.dart';

class Nivel8Page extends StatefulWidget {
  const Nivel8Page({super.key});

  @override
  State<Nivel8Page> createState() => _Nivel8PageState();
}

class _Nivel8PageState extends State<Nivel8Page> {
  final List<Map<String, dynamic>> preguntas = [
  {
  "pregunta":
      "¿Qué es Diphyllobothrium latum?",
  "opciones": [
    "Una tenia parasitaria",
    "Una bacteria",
    "Un virus",
    "Un hongo",
  ],
  "respuesta": "Una tenia parasitaria",
},
{
  "pregunta":
      "¿Cuál es otro nombre común de Diphyllobothrium latum?",
  "opciones": [
    "Tenia del pescado",
    "Tenia del cerdo",
    "Tenia del perro",
    "Tenia de la malaria",
  ],
  "respuesta": "Tenia del pescado",
},
{
  "pregunta":
      "¿Cómo se infecta una persona con este parásito?",
  "opciones": [
    "Comiendo pescado crudo o poco cocinado",
    "Por picaduras de mosquito",
    "Por el aire",
    "Por beber leche",
  ],
  "respuesta": "Comiendo pescado crudo o poco cocinado",
},
{
  "pregunta":
      "¿Qué tipo de pescado suele transmitir la infección?",
  "opciones": [
    "Pescado de agua dulce",
    "Pescado de pecera",
    "Pescado enlatado",
    "Pescado seco",
  ],
  "respuesta": "Pescado de agua dulce",
},
{
  "pregunta":
      "¿En qué parte del cuerpo vive normalmente el parásito adulto?",
  "opciones": [
    "Intestino delgado",
    "Pulmones",
    "Corazón",
    "Hígado",
  ],
  "respuesta": "Intestino delgado",
},
{
  "pregunta":
      "¿Qué nutriente roba principalmente este parásito al huésped?",
  "opciones": [
    "Vitamina B12",
    "Vitamina C",
    "Calcio",
    "Vitamina D",
  ],
  "respuesta": "Vitamina B12",
},
{
  "pregunta":
      "La falta de vitamina B12 puede provocar...",
  "opciones": [
    "Anemia megaloblástica",
    "Miopía",
    "Asma",
    "Raquitismo",
  ],
  "respuesta": "Anemia megaloblástica",
},
{
  "pregunta":
      "¿Cuál de estos síntomas puede aparecer en una persona infectada?",
  "opciones": [
    "Dolor abdominal",
    "Pérdida de audición",
    "Fracturas espontáneas",
    "Pérdida de olfato",
  ],
  "respuesta": "Dolor abdominal",
},
{
  "pregunta":
      "¿Qué otro síntoma puede producir la infección?",
  "opciones": [
    "Diarrea",
    "Varicela",
    "Cataratas",
    "Hipertensión inmediata",
  ],
  "respuesta": "Diarrea",
},
{
  "pregunta":
      "¿Cómo se diagnostica comúnmente la infección?",
  "opciones": [
    "Buscando huevos o segmentos en las heces",
    "Radiografía dental",
    "Electrocardiograma",
    "Prueba auditiva",
  ],
  "respuesta": "Buscando huevos o segmentos en las heces",
},
{
  "pregunta":
      "¿Qué puede ocurrir si el déficit de vitamina B12 es grave?",
  "opciones": [
    "Problemas neurológicos",
    "Cambio de color de ojos",
    "Crecimiento acelerado",
    "Mayor resistencia física",
  ],
  "respuesta": "Problemas neurológicos",
},
{
  "pregunta":
      "¿Puede una persona infectada no presentar síntomas?",
  "opciones": [
    "Sí",
    "No",
  ],
  "respuesta": "Sí",
},
{
  "pregunta":
      "¿Cómo se puede prevenir esta infección?",
  "opciones": [
    "Cocinando bien el pescado",
    "Tomando antibióticos",
    "Tomando más agua",
    "Durmiendo más horas",
  ],
  "respuesta": "Cocinando bien el pescado",
},
{
  "pregunta":
      "¿Qué otra medida ayuda a evitar la infección?",
  "opciones": [
    "Congelar adecuadamente el pescado",
    "Añadir sal únicamente",
    "Dejar el pescado al sol",
    "Lavarlo con jabón",
  ],
  "respuesta": "Congelar adecuadamente el pescado",
},
{
  "pregunta":
      "¿La infección por Diphyllobothrium latum tiene tratamiento médico efectivo?",
  "opciones": [
    "Verdadero",
    "Falso",
  ],
  "respuesta": "Verdadero",
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

class ResultadoPage extends StatelessWidget {
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
  Widget build(BuildContext context) {
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

          Text(
            "✅ Correctas: $correctas",
            style: const TextStyle(
              fontSize: 24,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            "❌ Incorrectas: $incorrectas",
            style: const TextStyle(
              fontSize: 24,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            "Revisión de respuestas",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          ...resultados.map((resultado) {
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