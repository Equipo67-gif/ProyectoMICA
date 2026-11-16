import 'package:flutter/material.dart';

class Nivel4Page extends StatefulWidget {
  const Nivel4Page({super.key});

  @override
  State<Nivel4Page> createState() => _Nivel4PageState();
}

class _Nivel4PageState extends State<Nivel4Page> {
  final List<Map<String, dynamic>> preguntas = [
    {
  "pregunta":"¿Cuál es la bacteria responsable de la Peste Negra?",
  "opciones": [
    "Yersinia pestis",
    "Escherichia coli",
    "Bacillus anthracis",
    "Staphylococcus aureus",
  ],
  "respuesta": "Yersinia pestis",
},
{
  "pregunta":
      "¿Dónde se encontró la primera evidencia histórica de la Peste Negra?",
  "opciones": [
    "Asia Central",
    "España",
    "América del Norte",
    "Australia",
  ],
  "respuesta": "Asia Central",
},
{
  "pregunta":
      "¿En qué siglo ocurrió la gran pandemia conocida como Peste Negra?",
  "opciones": [
    "Siglo XIV",
    "Siglo X",
    "Siglo XVII",
    "Siglo XX",
  ],
  "respuesta": "Siglo XIV",
},
{
  "pregunta":
      "¿Cuál fue uno de los principales medios de transmisión de la enfermedad?",
  "opciones": [
    "Pulgas infectadas",
    "Mosquitos",
    "Agua contaminada",
    "Plantas venenosas",
  ],
  "respuesta": "Pulgas infectadas",
},
{
  "pregunta":
      "¿Qué animal fue clave en la propagación de la peste durante la Edad Media?",
  "opciones": [
    "Ratas",
    "Caballos",
    "Perros",
    "Palomas",
  ],
  "respuesta": "Ratas",
},
{
  "pregunta":
      "¿Qué forma de peste puede transmitirse entre personas mediante gotículas respiratorias?",
  "opciones": [
    "Peste neumónica",
    "Peste bubónica",
    "Peste septicémica",
    "Peste intestinal",
  ],
  "respuesta": "Peste neumónica",
},
{
  "pregunta":
      "¿Cuál era uno de los síntomas más característicos de la peste bubónica?",
  "opciones": [
    "Inflamación dolorosa de ganglios",
    "Pérdida de cabello",
    "Sordera temporal",
    "Ceguera permanente",
  ],
  "respuesta": "Inflamación dolorosa de ganglios",
},
{
  "pregunta":
      "¿Cómo se llaman los ganglios inflamados característicos de esta enfermedad?",
  "opciones": [
    "Bubones",
    "Pústulas",
    "Nódulos",
    "Abscesos",
  ],
  "respuesta": "Bubones",
},
{
  "pregunta":
      "Además de los bubones, ¿qué otro síntoma era frecuente?",
  "opciones": [
    "Fiebre alta",
    "Fracturas óseas",
    "Pérdida de memoria",
    "Aumento de apetito",
  ],
  "respuesta": "Fiebre alta",
},
{
  "pregunta":
      "¿Qué sistema del cuerpo suele verse afectado primero por la bacteria?",
  "opciones": [
    "Sistema linfático",
    "Sistema óseo",
    "Sistema reproductor",
    "Sistema endocrino",
  ],
  "respuesta": "Sistema linfático",
},
{
  "pregunta":
      "¿Qué podía ocurrir si la enfermedad no recibe tratamiento?",
  "opciones": [
    "Septicemia",
    "Muerte cerebral",
    "Solo dolor muscular",
    "Pérdida del gusto",
  ],
  "respuesta": "Septicemia",
},
{
  "pregunta":
      "¿Cómo se trata actualmente la peste si se detecta a tiempo?",
  "opciones": [
    "Con antibióticos",
    "Con vacunas únicamente",
    "Con cirugía",
    "Con vitaminas",
  ],
  "respuesta": "Con antibióticos",
},
{
  "pregunta":
      "En italia barcos y personas que llegaban tenian que esperar 40 dias que italiano significa Quaranta giorni que con el tiempo luego se llamaria...",
  "opciones": [
    "Cuarentena",
    "Cancer",
    "Pandemia",
    "Brote",
  ],
  "respuesta": "La cuarentena",
},
{
  "pregunta":
      "¿Qué acción ayuda a prevenir nuevos brotes en zonas de riesgo?",
  "opciones": [
    "Control de roedores y pulgas",
    "Evitar los vegetales",
    "Reducir la actividad física",
    "Consumir más proteínas",
  ],
  "respuesta": "Control de roedores y pulgas",
},
{
  "pregunta":
      "¿La peste negra sigue existiendo en algunos lugares del mundo actualmente?",
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