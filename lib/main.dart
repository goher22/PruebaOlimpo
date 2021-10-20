import 'package:flutter/material.dart';
import 'package:movil_prueba/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (_) => CapturDataScreen(),
        'geo': (_) => GeopositioningScreen(),
        'save': (_) => SaveScreen(),
        'status': (_) => StatusSemaphoreScreen(),
        'take': (_) => TakePhoteScreen()
      },
    );
  }
}
