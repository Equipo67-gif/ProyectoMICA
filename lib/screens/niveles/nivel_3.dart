import 'package:flutter/material.dart';
import 'package:main/screens/resultado_page.dart';

class Nivel3Page extends StatefulWidget {
  const Nivel3Page({super.key});

  @override
  State<Nivel3Page> createState() => _Nivel3PageState();
}

class _Nivel3PageState extends State<Nivel3Page> {
  final List<Map<String, dynamic>> preguntas = [
    {
      "pregunta":
          "¿Como se llama el botulismo?",
      "opciones": ["Streptococcus pyogenes", "Bacillus subtilis", "Clostridium botulinum", "Neisseria gonorrhoeae",],
      "respuesta": "Clostridium botulinum",
    },
    {
      "pregunta":
          "¿Cual es la condicion principal para que se reprodusca la bacteria?",
      "opciones": ["zonas ricas en proteinas",
       "Zonas en condiciones frias",
        "Zonas con nada de oxigeno", 
        "Zonas con humedad contaminada",],
      "respuesta": "Zonas con nada de oxigeno",
    },
    {
      "pregunta":
          "¿Como se transmite?",
      "opciones": ["Contacto, excresion",
       "Aire, metal oxidado",
        "Alimentos contaminados,heridas", 
        "Mordedura de animales e incectos",],
      "respuesta": "Alimentos contaminados,heridas",
    },
    {
      "pregunta":
          "¿En que casos especificos?",
      "opciones": ["tocarse la cara con manos sucias",
       "Aguas negras",
        "Alimentos mal enlatados y heridas profundas", 
        "Monos y mosquitos de la selva",],
      "respuesta": "Alimentos mal enlatados, heridas profundas",
    },
    {
      "pregunta":
          "Esta bacteria suelta esporas ¿Que caracteristica tienen las esporas?",
      "opciones": [
        "Casi indestructibles",
        "Failes de identificar",
        "Adhieren a las plantas",
        "*No hace nada*",
      ],
      "respuesta":
          "Casi indestructibles",
    },
    {
      "pregunta":
          "¿Cuanto es su periodo de incubacion antes de generar los sintomas en heridas?",
      "opciones": [
        "3-4 dias",
        "4-14 dias",
        "6-7 dias",
        "12-24 horas",
      ],
      "respuesta":
          "4-14 dias",
    },
    
    {
      "pregunta":
          "¿Cuanto es su periodo de incubacion antes de generar los sintomas en lo alimentario?",
      "opciones": [
        "6-8 a 35 horas",
        "9-10 a 14 horas",
        "5-7 a 24 horas",
        "6-8 a 36 horas",
      ],
      "respuesta": "6-8 a 36 horas",
    },
    {
      "pregunta":
          "¿Que es lo que genera la bacteria?",
      "opciones": [
       "Infectar el cuerpo sin ser detectado",
        "un debugeo",
        "Generacion de hongos",
        "Toxina botulinica",
      ],
      "respuesta": "Toxina botulinica",
    },
    {
      "pregunta":
          "¿En que area afecta principalmente?",
      "opciones": ["Celulas",     
       "musculos",
        "Neuronas",
        "linfomas",
        ],
      "respuesta": "Neuronas",
    },
    {
      "pregunta":
          "Si elegiste neuronas pos que bien si no, que pende...¿Como afecta negativamente a las neuronas?",
      "opciones": ["Crean sobre dosis como drogas", 
      "Inpide que los musculos del cuerpo se muevan",
       "Genera sordera",
      "Movimientos involutarios",
        ],
      "respuesta": "Inpide que los musculos del cuerpo se muevan",
    },
    {
      "pregunta":
          "¿Que otros sintomas puede presentar?",
      "opciones": ["Respiracion rapida, dificultad para abrir la boca", 
      "Enbolia, taquicardia, no mover la vista",
       "ceguera, paralisis en la mitad del cuerpo",
      "Parpados caidos, Dificultad para hablar,tragar, respirar",
        ],
      "respuesta": "Parpados caidos, Dificultad para hablar,tragar, respirar",
    },
    {
      "pregunta":
          "¿Cual es la causa de muerte mas comun?",
      "opciones": ["Falta de respiracion", 
      "Destruccion de neuronas",
       "Infarto",
      "Tos con sangre",
        ],
      "respuesta": "Falta de respiracion",
    },
    {
      "pregunta":
          "¿Como curar a alguien de botulismo?",
      "opciones": ["Con penicilina", 
      "Con una antitoxina",
       "Con una operacion",
      "Caldo de guayaba",
        ],
      "respuesta": "Con una antitoxina",
    },
     {
      "pregunta":
          "¿Como evitar su contagio?",
      "opciones": ["No consumir conservas mal hechas, estricta higiene", 
      "Mantenerse hidratado",
       "consumiendo medicamentos para evitar el contagio",
      "Consumiendo alimentos salados",
        ],
      "respuesta": "filtrar a los animales contagiados, lavarse las manos",
    },
    {
      "pregunta":
          "Al curarse del botulismo puedes ser inmune en caso de otra infeccion",
      "opciones": ["Verdadero", 
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