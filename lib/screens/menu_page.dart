import 'package:flutter/material.dart';
import 'package:main/paleta.dart';
import 'niveles_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Paleta.fondoMenu,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/aplicacion.png",
              width: 120,
              height: 120,
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/gifs/bacteria.gif",
                  width: 80,
                  height: 80,
                ),

                const SizedBox(width: 15),

                Text(
                  "Biología Emergente",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Paleta.textoBlanco,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NivelesPage(),
                  ),
                );
              },
              icon: Icon(
                Icons.play_arrow,
                size: 28,
                color: Paleta.textoBlanco,
              ),
              label: const Text(
                "Jugar",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Paleta.botonPrimario,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 14,
                ),
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/settings'),
              child: const Text("Opciones"),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/credits'),
              child: const Text("Créditos"),
            ),
          ],
        ),
      ),
    );
  }
}