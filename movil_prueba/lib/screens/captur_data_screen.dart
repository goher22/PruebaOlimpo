import 'package:flutter/material.dart';
import 'package:movil_prueba/ui/input_decorations.dart';

class CapturDataScreen extends StatelessWidget {
  const CapturDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de usuarios'),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'Nombre de usuario',
                    labelText: 'Nombre:',
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'Cedula de usuario',
                    labelText: 'Cedula:',
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'Dirección de usuario',
                    labelText: 'Dirección:',
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'Ciudad de usuario',
                    labelText: 'Ciudad:',
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'País de usuario',
                    labelText: 'País:',
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'Celular de usuario',
                    labelText: 'Celular:',
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () {
          Navigator.pushNamed(context, 'take');
        },
      ),
    );
  }
}
