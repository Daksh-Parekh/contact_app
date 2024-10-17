import 'package:contact_app/views/home_page/model/models.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  int selectedIndex = 0;
  List<ContactModel> allContacts = [];

  void addContact(ContactModel modes) {
    allContacts.add(modes);
    notifyListeners();
  }

  void deleteContact(int index) {
    allContacts.removeAt(index);
    notifyListeners();
  }

  void updateContact(ContactModel model) {
    allContacts[selectedIndex] = model;
    notifyListeners();
  }

  void setIndex(int index) {
    selectedIndex = index;
  }
}
