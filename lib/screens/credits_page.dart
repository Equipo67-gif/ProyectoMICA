import 'package:flutter/material.dart';

class CreditsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Créditos")),
      body: Center(child: Text("Miguel, Luis, Alejandro, Itzel")),
    );
  }
}