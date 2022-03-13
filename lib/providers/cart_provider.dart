import 'dart:convert';
import 'dart:developer';

import 'package:efgecom/models/featured_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  int _cartCount =0;
  int _itemCount = 0;
  double _totalPrice = 0;

  List<FeaturedProductModel> _items = [];

  List<FeaturedProductModel> get items => _items;


  int get cartCount => _cartCount;
  int get itemCount => _itemCount;
  double get totalPrice => _totalPrice;


  void _setPrefitems() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var list = [];
      for(var i in _items){
        list.add(i.toMap());
      }
      var str = jsonEncode(list);
      prefs.setString('items', str);
      prefs.setInt('cartCount', _cartCount);
      prefs.setDouble('totalPrice', _totalPrice);
      notifyListeners();
    } on Exception catch (e) {
      log('set prefs error: ${e.toString()}');
    }
  }

  void _getPrefitems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _cartCount = prefs.getInt('cartCount') ?? 0;
    _totalPrice = prefs.getDouble('totalPrice') ?? 0.0;
    notifyListeners();
  }

  void addToCart(FeaturedProductModel item){

    var index = _items.indexWhere((element) => element.productId == item.productId);

    if(index>=0){
      _items[index].quantity = _items[index].quantity + 1;
      _setPrefitems();
    }
    else{
      _items.add(item);
      _cartCount++;
      _setPrefitems();
    }

  }

  void removeQuantity(FeaturedProductModel item){
    var index = _items.indexWhere((element) => element.productId == item.productId);
    if(index>=0){
      _items[index].quantity = _items[index].quantity - 1;
      _setPrefitems();
    }
    notifyListeners();
  }

  void deleteFromCart(FeaturedProductModel item){
    var index = _items.indexWhere((element) => element.productId == item.productId);
    if(index>=0){
      _items.removeAt(index);
      _cartCount--;
      _setPrefitems();
    }
    notifyListeners();
  }

  int? getItemCount (int productId){
    var index = _items.indexWhere((element) => element.productId == productId);

    if(index>=0){
      return _items[index].quantity;
    }
    else{
      return 0;
    }
  }

  int getCartCount() {
    _getPrefitems();
    return _cartCount;
  }

  void addTotalPrice(double price) {
    _totalPrice = _totalPrice + price;
    _setPrefitems();
    notifyListeners();
  }

  void minusTotalPrice(double price) {
    _totalPrice = _totalPrice - price;
    _setPrefitems();
    notifyListeners();
  }

  double getTotalPrice() {
    _getPrefitems();
    return _totalPrice;
  }

}
