import 'package:contact_app/views/home_page/model/models.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  int selectedIndex = 0;
  List<ContactModel> allContacts = [
    ContactModel(contact: "87498784", email: "dazx@gmail.com", name: "dax"),
  ];
  List<ContactModel> hideContacts = [];

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

  void hideContact(ContactModel models) {
    hideContacts.add(models);
    allContacts.removeAt(selectedIndex);
    notifyListeners();
  }

  void unlockContatc(ContactModel model) {
    allContacts.add(model);
    hideContacts.removeAt(selectedIndex);
    notifyListeners();
  }

  void updateHideContact(ContactModel model) {
    hideContacts[selectedIndex] = model;
    notifyListeners();
  }
}
