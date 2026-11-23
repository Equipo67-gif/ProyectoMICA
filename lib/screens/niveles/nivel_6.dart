import 'package:flutter/material.dart';
import 'package:main/screens/resultado_page.dart';

class Nivel6Page extends StatefulWidget {
  const Nivel6Page({super.key});

  @override
  State<Nivel6Page> createState() => _Nivel6PageState();
}

class _Nivel6PageState extends State<Nivel6Page> {
  final List<Map<String, dynamic>> preguntas = [
    {
  "pregunta":
      "¿Qué causa principalmente el escorbuto?",
  "opciones": [
    "Falta de calcio",
    "Falta de vitamina D",
    "Falta de hierro",
    "Falta de vitamina C",
  ],
  "respuesta": "Falta de vitamina C",
},
{
  "pregunta":
      "¿Qué vitamina es esencial para prevenir el escorbuto?",
  "opciones": [
    "Vitamina C",
    "Vitamina A",
    "Vitamina K",
    "Vitamina B12",
  ],
  "respuesta": "Vitamina C",
},
{
  "pregunta":
      "¿Qué otro nombre se le conoce a la enfermedad?",
  "opciones": [
    "Oxidacion cutanea",
    "Efecto whiter",
    "La enfermedad del naufrago",
    "Degradado de piel",
  ],
  "respuesta": "La enfermedad del naufrago",
},

{
  "pregunta":
      "¿Cual es la causa de tener un escorbuto?",
  "opciones": [
    "Pasaban meses sin frutas o verduras",
    "Bebían demasiada agua",
    "Dormían poco",
    "Estaban expuestos al sol",
  ],
  "respuesta": "Porque pasaban meses sin frutas o verduras",
},
{
  "pregunta":
      "¿Qué función importante cumple la vitamina C en el organismo?",
  "opciones": [
    "Ayuda a producir colágeno",
    "Produce glóbulos rojos",
    "Controla la temperatura corporal",
    "Produce insulina",
  ],
  "respuesta": "Ayuda a producir colágeno",
},
{
  "pregunta":
      "¿Qué síntoma suele aparecer en las encías de una persona con escorbuto?",
  "opciones": [
    "Sangrado e inflamación",
    "Cambio de color azul",
    "Pérdida de sensibilidad",
    "Aumento del tamaño de los dientes",
  ],
  "respuesta": "Sangrado e inflamación",
},
{
  "pregunta":
      "¿Qué puede ocurrir con los dientes en casos graves de escorbuto?",
  "opciones": [
    "Pueden aflojarse y caerse",
    "Se vuelven más fuertes",
    "Crean una capa extra de esmalte",
    "Se vuelven transparentes",
  ],
  "respuesta": "Pueden aflojarse y caerse",
},
{
  "pregunta":
      "¿Cuál de estos síntomas también es común en el escorbuto?",
  "opciones": [
    "Fatiga y debilidad",
    "Aumento de visión nocturna",
    "Mayor fuerza muscular",
    "Crecimiento acelerado",
  ],
  "respuesta": "Fatiga y debilidad",
},
{
  "pregunta":
      "¿Qué parte del cuerpo suele verse afectada por una mala producción de colágeno?",
  "opciones": [
    "Piel, encías y vasos sanguíneos",
    "Pulmones únicamente",
    "Hígado únicamente",
    "Oídos únicamente",
  ],
  "respuesta": "Piel, encías y vasos sanguíneos",
},
{
  "pregunta":
      "¿Qué tipo de manchas pueden aparecer en la piel debido al escorbuto?",
  "opciones": [
    "Pequeñas manchas de sangrado",
    "Manchas verdes",
    "Manchas fluorescentes",
    "Manchas permanentes negras",
  ],
  "respuesta": "Pequeñas manchas de sangrado",
},
{
  "pregunta":
      "Las heridas o lesiones cicatrizadas se vuelven abrir",
  "opciones": [
    "Verdadero",
    "Falso",
  ],
  "respuesta": "Verdadero",
},
{
  "pregunta":
      "¿Cómo se trata principalmente el escorbuto?",
  "opciones": [
    "Consumir vitamina C",
    "Tomar antibióticos",
    "Aplicar vacunas",
    "Realizar cirugía",
  ],
  "respuesta": "Consumir vitamina C",
},
{
  "pregunta":
      "¿Cuál de estos alimentos es rico en vitamina C?",
  "opciones": [
    "Papaya",
    "Pan blanco",
    "Carne de res",
    "Arroz",
  ],
  "respuesta": "Papaya",
},
{
  "pregunta":
      "¿Qué otro alimento mas comun podria ayudar a prevenir el escorbuto?",
  "opciones": [
    "Limón",
    "Mantequilla",
    "Sal",
    "Azúcar",
  ],
  "respuesta": "Limón",
},

{
  "pregunta":
      "¿Cuánto tiempo puede tardar una persona en desarrollar escorbuto si no consume suficiente vitamina C?",
  "opciones": [
    "8 años",
    "11 semanas",
    "1 día",
    "3 meses",
  ],
  "respuesta": "3 meses",
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