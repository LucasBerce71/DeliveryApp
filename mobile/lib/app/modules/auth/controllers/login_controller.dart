import 'package:flutter/material.dart';
import 'package:mobile/app/exceptions/rest_exception.dart';
import 'package:mobile/app/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends ChangeNotifier {
  bool showLoader;
  String error;
  bool loginSuccess;
  final _authRepository = AuthRepository();

  Future<void> login(String email, String password) async {
    showLoader = true;
    error = null;
    loginSuccess= false;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2), (){});
    showLoader = false;
    notifyListeners();
    try {
      final user = await _authRepository.login(email, password);
      final sp = await SharedPreferences.getInstance();
      sp.setString('user', user.toJson());
      showLoader = false;
      loginSuccess = true;
    } on RestException catch (e) {
      print(e);
      error = e.message;
      showLoader = false;
    } catch (e) {
      print(e);
      error = 'Erro ao autenticar o usuário';
      showLoader = false;
    } finally {
      notifyListeners();
    }
  }
}