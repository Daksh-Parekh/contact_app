import 'package:contact_app/views/home_page/model/models.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class HomeProvider with ChangeNotifier {
  int selectedIndex = 0;
  List<ContactModel> allContacts = [];
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

  Future<bool> openHideContact() async {
    LocalAuthentication authn = LocalAuthentication();

    bool isBiometricCheck = await authn.canCheckBiometrics;
    bool isDeviceSupport = await authn.isDeviceSupported();

    if (isBiometricCheck && isDeviceSupport) {
      List<BiometricType> availableBiometric =
          await authn.getAvailableBiometrics();

      if (availableBiometric.isEmpty) {
        return false;
      } else {
        return await authn.authenticate(localizedReason: "Done");
      }
    } else {
      return false;
    }
  }
}
