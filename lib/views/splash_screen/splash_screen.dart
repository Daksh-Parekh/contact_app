import 'dart:developer';

import 'package:contact_app/routes/app_routes.dart';
import 'package:contact_app/utils/helper/shr_helper.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    ShrHelper shr = ShrHelper();
    shr.readIntroScreen().then(
      (value) {
        if (value == true) {
          Future.delayed(Duration(seconds: 3), () {
            Navigator.pushReplacementNamed(context, AppRoutes.homePage);
          });
        } else {
          Future.delayed(
            Duration(seconds: 3),
            () {
              Navigator.pushReplacementNamed(context, AppRoutes.homePage);
            },
          );
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'lib/utils/images/splash.gif',
        ),
      ),
    );
  }
}
