import 'package:flutter/material.dart';
import 'package:movil_prueba/providers/users_provider.dart';
import 'package:movil_prueba/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(Appstae());

class Appstae extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsersProvider()),
      ],
      child: MyApp(),
    );
  }
}

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
