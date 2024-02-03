import 'package:stacked/stacked.dart';

class ProductViewModel extends BaseViewModel {

  int currentImage = 0;
  int currentColor = 0;
  int currentNumber = 1;


  increment(int num) {
    currentNumber = currentNumber++;
    rebuildUi();
  }
  decrement(int num) {
    if(currentNumber != 1) {
    currentNumber = currentNumber--;
    rebuildUi();
    }
  }
}
