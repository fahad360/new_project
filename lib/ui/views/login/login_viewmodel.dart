import 'package:flutter/material.dart';
import 'package:new_project/app/app.locator.dart';
import 'package:new_project/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  TextEditingController? emailController;
  TextEditingController? passwordController;

  bool? validateField;

  bool isPasswordVisible = false;

  BuildContext? context;


  Future navigateToSignupView() async {
    _navigationService.replaceWithSignupView();
  }

  Future<void> loginUserAndNavigate() async {
    setBusy(true);
    // try {
    //   var userStatus = await _authService.loginUserWithEmailPassword(
    //     email: emailController!.text,
    //     password: passwordController!.text,
    //   );
    //   if (userStatus == 'success') {
    //     _utilitiyService.showSuccessBar(context!, 'User Logged In Successfully');
    //     await navigateToSelectRoleView();
    //   } else if (userStatus == 'user-not-found') {
    //     _utilitiyService.showErrorBar(context!, 'User Not Found');
    //   } else if (userStatus == 'wrong-password') {
    //     _utilitiyService.showErrorBar(context!, 'Wrong Password');
    //   } else if (userStatus == 'error') {
    //     _utilitiyService.showErrorBar(context!, 'User Logging Error');
    //   }
    // } catch (e) {
    //   _utilitiyService.showErrorBar(context!, 'Error in Login User');
    // }
    setBusy(false);
  }

  void changeBool() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }
}
