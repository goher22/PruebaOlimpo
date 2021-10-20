import 'package:flutter/material.dart';
import 'package:movil_prueba/providers/users_provider.dart';
import 'package:movil_prueba/services/services.dart';
import 'package:provider/provider.dart';

class SaveScreen extends StatelessWidget {
  const SaveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UsersServices>(context);
    final userProvider = Provider.of<UsersProvider>(context);
    return Scaffold(
      body: Center(
        child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            disabledColor: Colors.grey,
            elevation: 0,
            color: Colors.deepPurple,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  userService.isSaving ? 'Espere' : 'Guardar',
                  style: TextStyle(color: Colors.white),
                )),
            onPressed: userService.isSaving
                ? null
                : () async {
                    await userService.saveOrCreateUser(userProvider.user!);
                    userProvider.clearUser();
                    Navigator.popUntil(context, ModalRoute.withName('home'));
                  }),
      ),
    );
  }
}
