import 'package:new_project/app/app.locator.dart';
import 'package:new_project/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NavbarViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  int index = 0;

  updateNav(int newIndex) {
    index = newIndex;
    if (newIndex == 0) {
      _navigationService.replaceWithProductListView();
    } else if (newIndex == 1) {
      _navigationService.replaceWithProductView();
    } else if (newIndex == 2) {
      _navigationService.replaceWithEditProfileView();
    } else if (newIndex == 3) {
      _navigationService.replaceWithSettingView();
    }
    notifyListeners();
  }
}
