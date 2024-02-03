import 'package:new_project/app/app.locator.dart';
import 'package:new_project/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductListViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  bool isFav = false;

  void changeIcon() {
    isFav = !isFav;
    rebuildUi();
  }

  // void navigateToProductDetail() {
  //   _navigationService.replaceWithProductView();
  // }

  Future navigateToProductDetail() async {
    _navigationService.replaceWithProductView();
  }
}
