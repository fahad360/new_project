import 'package:flutter/material.dart';
import 'package:new_project/app/app.locator.dart';
import 'package:new_project/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  TextEditingController? emailController;
  TextEditingController? passwordController;

  bool? validateField;

  bool isPasswordVisible = false;

  BuildContext? context;

  Future navigateToLoginView() async {
    _navigationService.replaceWithLoginView();
  }

  Future<void> registerUserAndNavigate() async {}

  void changeBool() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }
}
