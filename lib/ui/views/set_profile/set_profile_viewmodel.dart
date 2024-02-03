import 'dart:io';

import 'package:flutter/material.dart';
import 'package:new_project/app/app.locator.dart';
import 'package:new_project/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SetProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  File? _selectedImage;
  File? get selectedImage => _selectedImage;
  set selectedImage(File? value) {
    _selectedImage = value;
    notifyListeners();
  }

  BuildContext? context;
  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  bool? validateField;

  Future<void> saveUserProfileAndNavigate() async {
    setBusy(true);
    _navigationService.replaceWithProductListView();
    // try {
    //   await _userService.updateUserProfile(
    //     firstName: firstNameController!.text,
    //     lastName: lastNameController!.text,
    //   );
    //   await navigateToCreatePinView();
    // } catch (e) {
    //   _utilityService.showErrorBar(context!, e.toString());
    // }
    setBusy(false);
  }

  Future navigateToHomeView() async {
    _navigationService.replaceWithHomeView();
  }

  showPicker({BuildContext? context}) {
    showModalBottomSheet(
        context: context!,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: const Text(
                        'Photo Library',
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {
                        // _selectImageFromGallery();
                        _navigationService.back();
                      }),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text(
                      'Camera',
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      // _selectImageFromCamera();
                      _navigationService.back();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  goBack() {
    _navigationService.back();
  }
}
