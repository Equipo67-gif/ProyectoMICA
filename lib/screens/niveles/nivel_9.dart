import 'package:flutter/material.dart';

class Nivel9Page extends StatefulWidget {
  const Nivel9Page({super.key});

  @override
  State<Nivel9Page> createState() => _Nivel9PageState();
}

class _Nivel9PageState extends State<Nivel9Page> {
  final List<Map<String, dynamic>> preguntas = [
   {
  "pregunta":
      "¿Qué es un prión?",
  "opciones": [
    "Un globulo blanco mal hecho",
    "Una super bacteria",
    "Una proteína mal plegada",
    "Un hongo cordyceps",
  ],
  "respuesta": "Una proteína mal plegada",
},
{
  "pregunta":
      "¿Con que materia genetico identifican los priones?",
  "opciones": [
     "Contienen ambos",
    "Solo ADN",
    "Solo ARN",
   "No contienen material genético",
  ],
  "respuesta": "No contienen material genético",
},
{
  "pregunta":
      "¿Qué enfermedad famosa en bovinos fue causada por priones?",
  "opciones": [
   "Caquexia cronica",
    "Enfermedad de las vacas locas",
    "Brucelosis",
    "Fiebre aftosa",
  ],
  "respuesta": "Enfermedad de las vacas locas",
},
{
  "pregunta":
      "¿Qué parte del cuerpo es principalmente afectada por los priones?",
  "opciones": [
    "Pulmones",
    "Cerebro",
    "Hígado",
    "Riñones",
  ],
  "respuesta": "Cerebro",
},
{
  "pregunta":
      "¿Qué órgano suele sufrir el mayor daño?",
  "opciones": [
    "Cerebro",
    "Corazón",
    "Estómago",
    "Páncreas",
  ],
  "respuesta": "Cerebro",
},
{
  "pregunta":
      "¿Qué ocurre cuando un prión entra en contacto con proteínas normales?",
  "opciones": [
    "Forza a mal plegarse",
    "Las destruye inmediatamente",
    "Las fortalece",
    "No ocurre nada",
  ],
  "respuesta": "Forza a mal plegarse",
},
{
  "pregunta":
      "¿Qué aspecto puede presentar el cerebro afectado por priones?",
  "opciones": [
    "Aspecto esponjoso(cerebro agujereado)",
    "Aspecto vacio(cerebro consumido)",
    "Aspecto hueco(cerebro sin interior)",
    "Aspecto líquido(cerebro licuado)",
  ],
  "respuesta": "Aspecto esponjoso(cerebro agujereado)",
},
{
  "pregunta":
      "¿Cómo se llaman las enfermedades producidas por priones?",
  "opciones": [
    "Encefalopatías espongiformes",
    "Zoonosis cronica",
    "Micosis",
    "Enteropatías",
  ],
  "respuesta": "Encefalopatías espongiformes",
},
{
  "pregunta":
      "¿Cuál de los siguientes síntomas puede aparecer?",
  "opciones": [
    "Pérdida de coordinación",
    "Aumento de fuerza",
    "Visión mejorada",
    "Mayor resistencia física",
  ],
  "respuesta": "Pérdida de coordinación",
},
{
  "pregunta":
      "¿Qué otro síntoma suele desarrollarse con el tiempo?",
  "opciones": [
    "Demencia progresiva",
    "Crecimiento acelerado",
    "Hipervisión",
    "Mayor memoria",
  ],
  "respuesta": "Demencia progresiva",
},
{
  "pregunta":
      "¿Cómo se puede transmitir los priones?",
  "opciones": [
    "Por agua contaminada",
    "Por picaduras de mosquito",
    "Por contacto con el infectado",
    "Consumiendo tejidos infectados",
  ],
  "respuesta": "Consumiendo tejidos infectados",
},
{
  "pregunta":
      "¿Qué tejido presenta mayor riesgo de contener priones?",
  "opciones": [
    "Piel",
    "Tejido cerebral",
    "Músculo",
    "Cabello",
  ],
  "respuesta": "Tejido cerebral",
},
{
  "pregunta":
      "¿Como evitar la infeccion por un prion?",
  "opciones": [
    "Mantener buena higiene",
    "Inyecciones anuales",
    "No comer taquitos de sesos mal cocinados"
    "Comiendo lacteos"
  ],
  "respuesta": "No comer taquitos de sesos mal cocinados",
},
{
  "pregunta":
      "¿Qué medida ayuda a prevenir la creacion de un prion?",
  "opciones": [
    "Control sanitario",
    "Tomar antibióticos",
    "La infeccion es espontanea",
    "Aplicar repelente",
  ],
  "respuesta": "La infeccion es espontanea",
},
{
  "pregunta":
      "¿Todas las personas sobreviven a la infeccion de priones?",
  "opciones": [
    "Verdadero",
    "Falso",
  ],
  "respuesta": "Falso",
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