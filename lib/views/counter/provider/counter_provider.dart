import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int i = 0;

  void increment() {
    i++;
    notifyListeners();
  }

  void decrement() {
    i--;
    notifyListeners();
  }

  void twoX() {
    i = i * 2;
    notifyListeners();
  }

  void threeX() {
    i *= 3;
    notifyListeners();
  }

  void fourX() {
    i *= 4;
    notifyListeners();
  }

  void refresh() {
    i = 0;
    notifyListeners();
  }
}
