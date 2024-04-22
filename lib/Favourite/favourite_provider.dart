import 'package:flutter/foundation.dart';

class FavouriteProvider with ChangeNotifier{
  List<int> _selectedItem = [];
  List<int> get selectedItem => _selectedItem;

  void addItem(int index){
    _selectedItem.add(index);
    notifyListeners();
  }
  void removeItem(int index){
    _selectedItem.remove(index);
    notifyListeners();
  }
}