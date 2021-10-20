import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:movil_prueba/models/models.dart';

class UsersServices extends ChangeNotifier {
  final String _baseUrl = 'https://prueba-olimpo-default-rtdb.firebaseio.com';
  bool isSaving = false;

  Future saveOrCreateProduct(User user) async {
    isSaving = true;
    notifyListeners();

    if (user.id == null) {
      // Es necesario crear
      await this.createProduct(user);
    } else {
      // Actualizar
      //await this.updateProduct( product );
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> createProduct(User user) async {
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.post(url, body: user.toJson());
    final decodedData = json.decode(resp.body);

    user.id = decodedData['name'];

    //TODO: Editar listado de usuario
    //this.users.add(product);

    return user.id!;
  }
}
