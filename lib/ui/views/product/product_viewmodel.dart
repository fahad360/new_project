import 'package:new_project/app/app.locator.dart';
import 'package:new_project/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  int currentImage = 0;
  int currentColor = 0;
  int currentNumber = 1;

  increment(int num) {
    currentNumber = currentNumber++;
    rebuildUi();
  }

  decrement(int num) {
    if (currentNumber != 1) {
      currentNumber = currentNumber--;
      rebuildUi();
    }
  }

  void goBack() {
    _navigationService.replaceWithProductListView();
  }
}
