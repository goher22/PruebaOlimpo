import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:movil_prueba/models/models.dart';

class UsersServices extends ChangeNotifier {
  final String _baseUrl = 'prueba-olimpo-default-rtdb.firebaseio.com';
  bool isSaving = false;

  Future saveOrCreateUser(User user) async {
    isSaving = true;
    notifyListeners();

    if (user.id == null) {
      // Es necesario crear
      await this.createUser(user);
    }
    // } else {
    //   // Actualizar
    //   await this.updateUser( product );
    // }
    isSaving = false;
    notifyListeners();
  }

  Future createUser(User user) async {
    final url = Uri.https(_baseUrl, 'users.json');
    await http.post(url, body: user.toJson());

    //TODO: Editar listado de usuario
    //this.users.add(user);
  }
}
