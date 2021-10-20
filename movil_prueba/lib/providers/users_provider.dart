import 'package:flutter/material.dart';

/**
 * Control de estado del formulario del usuario al registrar
 */
class UsersProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  //Datos del usuario
  String name = '';
  String iCard = '';
  String address = '';
  String city = '';
  String country = '';
  String mobile = '';

  //Control de peticiones
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
