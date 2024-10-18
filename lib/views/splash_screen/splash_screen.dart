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
            Navigator.pushReplacementNamed(context, AppRoutes.introPage);
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
      body: Center(
        child: Container(
          color: Colors.blue,
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
