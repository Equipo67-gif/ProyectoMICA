import 'package:flutter/material.dart';
import 'package:main/screens/resultado_page.dart';

class Nivel5Page extends StatefulWidget {
  const Nivel5Page({super.key});

  @override
  State<Nivel5Page> createState() => _Nivel5PageState();
}

class _Nivel5PageState extends State<Nivel5Page> {
  final List<Map<String, dynamic>> preguntas = [
    {
  "pregunta":
      "¿Qué tipo de enfermedad es la rabia?",
  "opciones": [
    "Bacteriana",
    "Viral",
    "Fúngica",
    "Parasitaria",
  ],
  "respuesta": "Viral",
},
{
  "pregunta":
      "¿Qué sistema del cuerpo afecta principalmente la rabia?",
  "opciones": [
    "Digestivo",
    "Respiratorio",
    "Nervioso",
    "Circulatorio",
  ],
  "respuesta": "Nervioso",
},
{
  "pregunta":
      "¿Qué animal es el principal transmisor de la rabia en zonas urbanas?",
  "opciones": [
    "Perro",
    "Caballo",
    "Gallina",
    "Conejo",
  ],
  "respuesta": "Perro",
},
{
  "pregunta":
      "¿Qué animales suelen transmitir rabia en zonas silvestres?",
  "opciones": [
    "Mariposas",
    "Peces",
    "Tortugas",
    "Murciélagos",
  ],
  "respuesta": "Murciélagos",
},
{
  "pregunta":
      "¿Cómo se transmite normalmente la rabia?",
  "opciones": [
     "Por el aire",
    "Por el agua",
   "Por la saliva de animales infectados",
    "Por alimentos contaminados",
  ],
  "respuesta": "Por la saliva de animales infectados",
},
{
  "pregunta":
      "¿Cuál es la forma más común de contagio?",
  "opciones": [
    "Toser",
    "Estornudos",
    "Picaduras de mosquito",
    "Mordeduras",
  ],
  "respuesta": "Mordeduras",
},
{
  "pregunta":
      "¿Cuanto tiempo tarda en aparecer los sintomas?",
  "opciones": [
    "2 a 8 minutos",
    "2 a 8 horas",
    "2 a 8 dias",
    "2 a 8 semanas",
  ],
  "respuesta": "2 a 8 semanas",
},
{
  "pregunta":
      "¿Qué órgano es finalmente afectado por el virus causando los síntomas más graves?",
  "opciones": [
    "Riñón",
    "Cerebro",
    "Pulmón",
    "Corazón",
  ],
  "respuesta": "Cerebro",
},
{
  "pregunta":
      "¿Cuál es uno de los primeros síntomas de la rabia?",
  "opciones": [
   "Hemorragias",
    "Parálisis inmediata",
    "Ceguera",
     "Fiebre y malestar general",
  ],
  "respuesta": "Fiebre y malestar general",
},
{
  "pregunta":
      "¿Qué sensación puede aparecer alrededor de la mordedura?",
  "opciones": ["Cambio de color de ojos",
    "Congelamiento",
    "Hormigueo o picazón",
    "Pérdida de hueso",
    
  ],
  "respuesta": "Hormigueo o picazón",
},
{
  "pregunta":
      "¿Qué síntoma avanzado da fama a esta enfermedad?",
  "opciones": [
    "Miedo al agua",
    "Pérdida del cabello",
    "Sordera",
    "Miopía",
  ],
  "respuesta": "Miedo al agua",
},
{
  "pregunta":
      "¿Cómo se conoce médicamente el miedo al agua causado por la rabia?",
  "opciones": [
    "Acrofobia",
    "Hidrofobia",
    "Agorafobia",
    "Aerofobia",
  ],
  "respuesta": "Hidrofobia",
},
{
  "pregunta":
      "¿Qué debe hacerse inmediatamente después de una mordedura sospechosa?",
  "opciones": [
    "Lavar la herida",
    "Cubrirla y esperar",
    "Aplicar hielo únicamente",
    "Tomar vitaminas",
  ],
  "respuesta": "Lavar la herida",
},
{
  "pregunta":
      "¿Existe una vacuna para prevenir la rabia?",
  "opciones": [
    "Sí",
    "No",
    "si",
    "no",
  ],
  "respuesta": "si",
},
{
  "pregunta":
      "¿Qué tratamiento puede administrarse antes de que aparezcan los síntomas?",
  "opciones": [
    "Vacunación",
    "Cirugía cerebral",
    "Radioterapia",
    "Quimioterapia",
  ],
  "respuesta": "Vacunación",
},
{
  "pregunta":
      "¿Qué ocurre generalmente cuando aparecen los síntomas graves y no se recibió tratamiento oportuno?",
  "opciones": [
    "Lobotomia",
    "La persona se recupera sola",
    "Encefalitis",
    "Falta de oxigeno",
  ],
  "respuesta": "Encefalitis",
},
{
  "pregunta":
      "Cual es la probabilidad de sobrevivir en etapa clinica",
  "opciones": [
    "0%",
    "25%",
    "57%",
    "83%",
  ],
  "respuesta": "0%",
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