import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:movil_prueba/models/models.dart';

class UsersServices extends ChangeNotifier {
  final String _baseUrl = 'https://prueba-olimpo-default-rtdb.firebaseio.com';
  User? user;
  bool isSaving = false;

  UsersServices() {
    _clearUser();
  }

  _clearUser() {
    this.user = User(
      name: '',
      iCard: '',
      address: '',
      city: '',
      country: '',
      mobile: '',
    );
  }

  Future saveOrCreateProduct() async {
    isSaving = true;
    notifyListeners();

    if (this.user!.id == null) {
      // Es necesario crear
      await this.createProduct();
    } else {
      // Actualizar
      //await this.updateProduct( product );
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> createProduct() async {
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.post(url, body: this.user!.toJson());
    final decodedData = json.decode(resp.body);

    this.user!.id = decodedData['name'];

    //TODO: Editar listado de usuario
    //this.users.add(product);

    return this.user!.id!;
  }
}
