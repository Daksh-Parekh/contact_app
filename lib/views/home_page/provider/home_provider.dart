import 'package:contact_app/views/home_page/model/models.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  List<ContactModel> allContacts = [];

  void addContact(ContactModel modes) {
    allContacts.add(modes);
    notifyListeners();
  }

  void deleteContact(int index) {
    allContacts.removeAt(index);
    notifyListeners();
  }
}
