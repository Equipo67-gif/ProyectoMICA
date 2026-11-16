import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Opciones")),
      body: Center(child: Text("Configuraciones del juego")),
    );
  }
}