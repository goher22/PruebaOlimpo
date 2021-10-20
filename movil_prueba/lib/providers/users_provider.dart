import 'package:flutter/material.dart';
import 'package:movil_prueba/models/models.dart';

/**
 * Control de estado del formulario del usuario al registrar
 */
class UsersProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  //Counstrutor
  UsersProvider() {
    this.clearUser();
  }

  //Datos del usuario
  User? user;

  //Limpiar Capo user
  clearUser() {
    user = User(
      name: '',
      iCard: '',
      address: '',
      city: '',
      country: '',
      mobile: '',
    );
    notifyListeners();
  }

  //Cambio en la imagen
  set pinture(String path) {
    user!.picture = path;
    notifyListeners();
  }

  //Control de peticiones
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //Validacion de formulario
  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
