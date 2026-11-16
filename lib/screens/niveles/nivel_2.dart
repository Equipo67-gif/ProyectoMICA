import 'package:flutter/material.dart';

class Nivel2Page extends StatefulWidget {
  const Nivel2Page({super.key});

  @override
  State<Nivel2Page> createState() => _Nivel2PageState();
}

class _Nivel2PageState extends State<Nivel2Page> {
  final List<Map<String, dynamic>> preguntas = [
    {
      "pregunta":
          "¿Donde se encuentra el Antrax?",
      "opciones": ["Regiones humedas", "Regiones Calidas", "Regiones frias", "Casi todo el mundo",],
      "respuesta": "Casi todo el mundo",
    },
    {
      "pregunta":
          "¿Como se llama el Antrax?",
      "opciones": ["Criptococosis",
       "Bacillus anthracis",
        "Bartonella henselae", 
        "Borrelia burgdorferi",],
      "respuesta": "Bacillus anthracis",
    },
    {
      "pregunta":
          "¿Como se transmite la infeccion?",
      "opciones": [
        "Esporas, carne infectada, contacto directo a la infeccion",
        "tos, picadura de mosquito, agua contaminada",
        "mordedura humana, pulgas",
        "sangre contaminada, vomitos, excreciones",
      ],
      "respuesta":
          "Esporas, carne infectada, contacto directo a la infeccion",
    },
    {
      "pregunta":
          "¿Como fue usado el antrax durante el siglo xx?",
      "opciones": [
        "Sinonimo de muerte lenta",
        "Investigacion",
        "Uso en medicina ",
        "bioarma",
      ],
      "respuesta":
          "bioarma",
    },
    {
      "pregunta":
          "¿Que zonas ataca?",
      "opciones": [
        "visual, neuronal, motriz",
        "nervios, linfomas, oidos",
        "Cutaneo, gastrointestinal, pulmonar",
        "cerebral, oseo",
      ],
      "respuesta": "Cutaneo, gastrointestinal, pulmonar",
    },
    {
      "pregunta":
          "¿Como funciona el antrax cutaneo?",
      "opciones": [
       "crea coagulos de sangre internos que penetran a los huesos cercanos provocando huecos grandes",
        "Provoca acne descontrolado a su vez de enrojecimiento en la zona",
        "Un Bulto e indoloro que despues de dias se transforma en úlcera indolora con un centro negro",
        "Provoca hemorragia interna casi a las 5hrs a la vez de granos",
      ],
      "respuesta": "Un Bulto e indoloro que despues de dias se transforma en úlcera indolora con un centro negro",
    },
    {
      "pregunta":
          "¿Que pasa si no se trata de forma adecuada?",
      "opciones": ["Crea necrosis en toda la zona de la infeccion causando putrefaccion",     
       "Replicacion forzosa de la celulas causando cancer",
        "La infección puede diseminarse al torrente sanguíneo, causando septicemia, shock o falla orgánica",
        "no c xd",
        ],
      "respuesta": "La infección puede diseminarse al torrente sanguíneo, causando septicemia, shock o falla orgánica",
    },
    {
      "pregunta":
          "¿Como funciona el antrax pulmonar?",
      "opciones": ["Sobre esfuerzo de los globulos blancos en destruir las esporas provocando daños en el revestimiento", 
      "Obstrucción de alvéolos por líquido de edema y microhemorragias",
       "Hirritacion extrema e inflamacion en la traquea",
      "Crea mucosidad en las entradas de los pulmones obstruyendo el flujo de aire",
        ],
      "respuesta": "Obstrucción de alvéolos por líquido de edema y microhemorragias",
    },
    {
      "pregunta":
          "¿Que pasa si no se trata de forma adecuada?",
      "opciones": ["Paralisis respiratorio a su vez de acumulacion de agua", 
      "Obstrucción de alvéolos por líquido de edema y microhemorragias",
       "Hirritacion extrema e inflamacion en la traquea",
      "Crea mucosidad en las entradas de los pulmones obstruyendo el flujo de aire",
        ],
      "respuesta": "Obstrucción de alvéolos por líquido de edema y microhemorragias",
    },
    {
      "pregunta":
          "¿Y como funciona el antrax gastrointestital?",
      "opciones": ["vomitos, diarrea hemorragica, fiebre alta", 
      "gastritis, disenteria grave, cancer",
       "ulceras, incufisencia renal",
      "colitis pseudomembranosa, desidratacion extrema, diarrea grave",
        ],
      "respuesta": "vomitos, diarrea hemorragica, fiebre alta",
    },
    {
      "pregunta":
          "¿yY que pasa cuando no se trata?",
      "opciones": ["Shock, pancreatitis aguda, celiaca", 
      "Autofagia, anemia, reflujo gastroesofágico",
       "muerte por desidratacion consecutivo",
      "Perforación intestinal, Peritonitis fulminante, Sepsis diseminada",
        ],
      "respuesta": "Perforación intestinal, Peritonitis fulminante, Sepsis diseminada",
    },
     {
      "pregunta":
          "¿Como evitar su contagio?",
      "opciones": ["filtrar a los animales contagiados, lavarse las manos", 
      "destruyendo las esporas con desororates",
       "consumiendo medicamentos para evitar el contagio",
      "Consumiendo alimentos salados",
        ],
      "respuesta": "filtrar a los animales contagiados, lavarse las manos",
    },
    {
      "pregunta":
          "¿Como evitar su contagio?",
      "opciones": ["filtrar a los animales contagiados, lavarse las manos", 
      "destruyendo las esporas con desororates",
       "consumiendo medicamentos para evitar el contagio",
      "Consumiendo alimentos salados",
        ],
      "respuesta": "filtrar a los animales contagiados, lavarse las manos",
    },
    {
      "pregunta":
          "¿Como curarse del antrax?",
      "opciones": ["Dependiendo del trato , cianuro, arsenico o urico", 
      "Dependiendo del trato, ciprofloxacino, doxiciclina o penicilina",
       "Dependiendo del trato, paracetamol",
      "Dependiendo del trato, VacA, Patulina o botulinica",
        ],
      "respuesta": "Dependiendo del trato, ciprofloxacino, doxiciclina o penicilina",
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