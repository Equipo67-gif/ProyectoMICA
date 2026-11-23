import 'package:flutter/material.dart';
import 'package:main/screens/resultado_page.dart';

class Nivel7Page extends StatefulWidget {
  const Nivel7Page({super.key});

  @override
  State<Nivel7Page> createState() => _Nivel7PageState();
}

class _Nivel7PageState extends State<Nivel7Page> {
  final List<Map<String, dynamic>> preguntas = [
   {
  "pregunta":
      "¿Qué organismo causa la toxoplasmosis?",
  "opciones": [
    "Plasmodium falciparum",
    "Yersinia pestis",
    "Clostridium botulinum",
    "Toxoplasma gondii",
  ],
  "respuesta": "Toxoplasma gondii",
},
{
  "pregunta":
      "¿Qué tipo de organismo es Toxoplasma gondii?",
  "opciones": [
    "Parásito",
    "Virus",
    "Bacteria",
    "Hongo",
  ],
  "respuesta": "Parásito",
},
{
  "pregunta":
      "¿Qué animal es el hospedador definitivo del parásito?",
  "opciones": [
    "Gato",
    "Perro",
    "Ratón",
    "Conejo",
  ],
  "respuesta": "Gato",
},
{
  "pregunta":
      "¿Cómo puede una persona contraer toxoplasmosis?",
  "opciones": [
    "Tomando demasiada agua",
    "Respirando aire frío",
    "Picadura de mosquito",
    "Comiendo carne contaminada mal cocida",
  ],
  "respuesta": "Comiendo carne contaminada mal cocida",
},
{
  "pregunta":
      "¿Qué otra forma común de contagio existe?",
  "opciones": [
   "Darse la mano",
    "Hablar con una persona infectada",
     "Manipular heces de gato infectado",
    "Compartir ropa",
  ],
  "respuesta": "Manipular heces de gato infectado",
},
{
  "pregunta":
      "¿Qué sistema suele ser el más afectado en casos graves?",
  "opciones": [
    "Sistema óseo",
    "Sistema nervioso",
    "Sistema digestivo",
    "Sistema endocrino",
  ],
  "respuesta": "Sistema nervioso",
},
{
  "pregunta":
      "¿Qué síntoma puede presentar una persona con toxoplasmosis leve?",
  "opciones": [
    "Fracturas espontáneas",
    "Parálisis inmediata",
    "Pérdida total de visión",
   "Fiebre y fatiga",
  ],
  "respuesta": "Fiebre y fatiga",
},
{
  "pregunta":
      "¿Qué personas presentan mayor riesgo de sufrir complicaciones?",
  "opciones": [
    "Personas deportistas",
    "Personas inmunodeprimidas",
    "Personas con miopía",
    "Personas con alergias",
  ],
  "respuesta": "Personas inmunodeprimidas",
},
{
  "pregunta":
      "¿Por qué la toxoplasmosis preocupa especialmente durante el embarazo?",
  "opciones": [
    "Disminuye su sangre oxigenada",
    "Produce anemia en el padre",
    "aborto espontáneo y defectos congénitos.",
    "Aumenta el apetito",
  ],
  "respuesta": "Puede afectar al feto",
},
{
  "pregunta":
      "¿Cómo se denomina la infección transmitida de madre a hijo durante el embarazo?",
  "opciones": [
    "Toxoplasmosis congénita",
    "Toxoplasmosis respiratoria",
    "Toxoplasmosis crónica",
    "Toxoplasmosis felina",
  ],
  "respuesta": "Toxoplasmosis congénita",
},
{
  "pregunta":
      "¿Qué órgano puede resultar gravemente dañado en bebés infectados antes de nacer?",
  "opciones": [
    "Páncreas",
    "Estómago",
    "Ojos",
    "Piel",
  ],
  "respuesta": "Ojos",
},
{
  "pregunta":
      "¿Qué medida ayuda a prevenir la toxoplasmosis?",
  "opciones": [
    "Cocinar bien la carne",
    "Dormir más horas",
    "Evitar el ejercicio",
    "Consumir más azúcar",
  ],
  "respuesta": "Cocinar bien la carne",
},
{
  "pregunta":
      "¿Qué se recomienda al limpiar la caja de arena de un gato?",
  "opciones": [
    "Añadir perfumes",
    "Usar solo agua",
    "No limpiarla nunca",
    "Usar guantes y lavarse las manos",
  ],
  "respuesta": "Usar guantes y lavarse las manos",
},
{
  "pregunta":
      "¿La toxoplasmosis puede tratarse con medicamentos específicos prescritos por un médico?",
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