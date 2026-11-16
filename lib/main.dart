import 'package:flutter/material.dart';
import 'screens/menu_page.dart';
import 'screens/play_page.dart';
import 'screens/settings_page.dart';
import 'screens/credits_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menú del Juego',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MenuPage(),
        '/play': (context) => PlayPage(),
        '/settings': (context) => SettingsPage(),
        '/credits': (context) => CreditsPage(),
      },
    );
  }
}