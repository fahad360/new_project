import 'package:new_project/app/app.locator.dart';
import 'package:new_project/app/app.router.dart';
import 'package:new_project/app/models/product_model.dart';
import 'package:new_project/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductListViewModel extends FutureViewModel<String> {
  final _navigationService = locator<NavigationService>();
  final _apiService = locator<ApiService>();

  List<Product> products = [];

  // late List<Product> _products;
  // List<Product> get products => _products;
  // set products(List<Product> value) {
  // _products = value;
  // notifyListeners();
  // }
   
  

  bool isFav = false;

  void changeIcon(int index) {
    isFav = !isFav;
    rebuildUi();
  }

  Future navigateToProductDetail() async {
    _navigationService.replaceWithProductView();
  }

  @override
  Future<String> futureToRun() => getDataFromServer();

  Future<String> getDataFromServer() async {
    products = await _apiService.getProducts();
    return 'This is fetched from everywhere';
  }
}
