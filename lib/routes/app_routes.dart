import 'package:contact_app/views/add_contact_page/add_contact_page.dart';
import 'package:contact_app/views/counter/views/counter.dart';
import 'package:contact_app/views/detail_page/views/detail_page.dart';
import 'package:contact_app/views/hide_page/hide_page.dart';
import 'package:contact_app/views/home_page/views/homePage.dart';
import 'package:contact_app/views/introduction_page/intro_page.dart';
import 'package:contact_app/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static String splashScreen = "/";
  static String introPage = "intro_page";
  static String homePage = "home_page";
  static String addContactPage = "contact_page";
  static String counter = "counter_provider";
  static String detailPage = "detail_page";
  static String hidePage = "hide_page";

  static Map<String, Widget Function(BuildContext)> routes = {
    splashScreen: (context) => SplashScreen(),
    introPage: (context) => IntroPage(),
    homePage: (context) => HomePage(),
    addContactPage: (context) => AddContactPage(),
    counter: (context) => CounterApp(),
    detailPage: (context) => DetailPage(),
    hidePage: (context) => HidePage(),
  };
}
