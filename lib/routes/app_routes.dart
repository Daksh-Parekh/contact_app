import 'package:contact_app/views/add_contact_page/add_contact_page.dart';
import 'package:contact_app/views/home_page/homePage.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static String homePage = "/";
  static String addContactPage = "contact_page";

  static Map<String, Widget Function(BuildContext)> routes = {
    homePage: (context) => HomePage(),
    addContactPage: (context) => AddContactPage()
  };
}
