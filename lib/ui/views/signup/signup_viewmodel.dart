import 'package:flutter/material.dart';
import 'package:new_project/app/app.locator.dart';
import 'package:new_project/app/app.router.dart';
import 'package:new_project/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  bool? validateField;

  bool isPasswordVisible = false;

  BuildContext? context;

  TextEditingController? emailController;
  TextEditingController? passwordController; 

  Future navigateToLoginView() async {
    _navigationService.replaceWithLoginView();
  }

  Future<void> registerUserAndNavigate() async {
    _authService.registerUserWithEmailPassword(
        email: emailController!.text, password: passwordController!.text);
  }

  void changeBool() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }
}
