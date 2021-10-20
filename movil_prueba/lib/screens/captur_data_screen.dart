import 'package:flutter/material.dart';
import 'package:movil_prueba/providers/users_provider.dart';
import 'package:movil_prueba/ui/input_decorations.dart';
import 'package:provider/provider.dart';

class CapturDataScreen extends StatelessWidget {
  const CapturDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UsersProvider>(context);
    final user = userProvider.user!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de usuarios'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: userProvider.formKey,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                TextFormField(
                  initialValue: user.name,
                  onChanged: (value) => user.name = value,
                  validator: (value) {
                    if (value == null || value.length < 1)
                      return 'El nombre es obligatorio';
                  },
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'Nombre de usuario',
                    labelText: 'Nombre:',
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  initialValue: user.iCard,
                  onChanged: (value) => user.iCard = value,
                  validator: (value) {
                    if (value == null || value.length < 1)
                      return 'La cedula es obligatorio';
                  },
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'Cedula de usuario',
                    labelText: 'Cedula:',
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  initialValue: user.address,
                  onChanged: (value) => user.address = value,
                  validator: (value) {
                    if (value == null || value.length < 1)
                      return 'La dirección es obligatorio';
                  },
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'Dirección de usuario',
                    labelText: 'Dirección:',
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  initialValue: user.city,
                  onChanged: (value) => user.city = value,
                  validator: (value) {
                    if (value == null || value.length < 1)
                      return 'La ciudad es obligatorio';
                  },
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'Ciudad de usuario',
                    labelText: 'Ciudad:',
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  initialValue: user.country,
                  onChanged: (value) => user.country = value,
                  validator: (value) {
                    if (value == null || value.length < 1)
                      return 'El país es obligatorio';
                  },
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'País de usuario',
                    labelText: 'País:',
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  initialValue: user.mobile,
                  onChanged: (value) => user.mobile = value,
                  validator: (value) {
                    if (value == null || value.length < 1)
                      return 'El celular es obligatorio';
                  },
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
          if (!userProvider.isValidForm()) return;
          Navigator.pushNamed(context, 'take');
        },
      ),
    );
  }
}
