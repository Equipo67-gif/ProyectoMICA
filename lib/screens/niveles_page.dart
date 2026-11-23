import 'package:flutter/material.dart';
import 'package:main/paleta.dart';
import 'package:main/screens/niveles/nivel_1.dart';
import 'package:main/screens/niveles/nivel_2.dart';
import 'package:main/screens/niveles/nivel_3.dart';
import 'package:main/screens/niveles/nivel_4.dart';
import 'package:main/screens/niveles/nivel_5.dart';
import 'package:main/screens/niveles/nivel_6.dart';
import 'package:main/screens/niveles/nivel_7.dart';
import 'package:main/screens/niveles/nivel_8.dart';
import 'package:main/screens/niveles/nivel_9.dart';

class NivelesPage extends StatelessWidget {
  const NivelesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Paleta.fondNiveles,
      appBar: AppBar(
        backgroundColor: Paleta.appBar,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              debugPrint("Abrir configuración");
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              padding: const EdgeInsets.all(20),
              children: List.generate(9, (index) {
                return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Nivel1Page(),
                        ),
                      );
                    } else if (index == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Nivel2Page(),
                        ),
                      );
                    } else if (index == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Nivel3Page(),
                        ),
                      );
                    } else if (index == 3) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Nivel4Page(),
                          ),
                        );
                    } else if (index == 4) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Nivel5Page(),
                          ),
                        );
                    } else if (index == 5) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Nivel6Page(),
                          ),
                        );
                    } else if (index == 6) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Nivel7Page(),
                          ),
                        );
                    } else if (index == 7) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Nivel8Page(),
                          ),
                        );
                    } else if (index == 8) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Nivel9Page()
                          ),
                        );
                    }
                    {
                      debugPrint(
                        "Nivel ${index + 1} aún no disponible",
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Paleta.botonOscuro,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/niveles/nivel${index + 1}.png",
                        fit: BoxFit.cover,
                        width: 120,
                        height: 120,
                        ),
                      ),
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed: () {
                debugPrint("Botón Niveles presionado");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Paleta.botonOscuro,
                foregroundColor: Paleta.textoBlanco,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 16,
                ),
              ),
              child: const Text("Niveles"),
            ),
          ),
        ],
      ),
    );
  }
}