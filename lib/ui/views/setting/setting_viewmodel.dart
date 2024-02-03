import 'package:new_project/app/app.locator.dart';
import 'package:new_project/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void goBack() {
    _navigationService.replaceWithProductListView();
  }

  void deleteAccount() {}

  void logout() {}

  void navigateToTermsAndConditions() {}

  void navigateToPrivacyPolicy() {}

  void navigateToFaqsSection() {}

  void navigateToRoleSection() {}

  void navigateToAddPunishsSection() {}

  void navigateToAddRewardSection() {}

  void navigateToHistoryView() {}

  void navigateToOldPINSection() {}

  void navigateToEditProfileSection() {}
}
