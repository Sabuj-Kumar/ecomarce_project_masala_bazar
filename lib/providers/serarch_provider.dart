import 'package:flutter/cupertino.dart';

class SearchProvider with ChangeNotifier{
  List<double> _priceRange = [];

  List<double> get priceRange => _priceRange;

  void changePriceRange(double minPrice, double maxPrice){
    _priceRange.insert(0, minPrice);
    _priceRange.insert(01, maxPrice);
    notifyListeners();
  }

}