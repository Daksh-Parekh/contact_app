import 'package:contact_app/routes/app_routes.dart';
import 'package:contact_app/utils/helper/shr_helper.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'Hello',
            body: "WELCOME!",
          ),
          PageViewModel(
            title: "Title",
            body: "Next..",
          )
        ],
        done: Text("Let's start..."),
        onDone: () {
          ShrHelper shrHelp = ShrHelper();
          shrHelp.saveIntroScreen();
          Navigator.pushReplacementNamed(context, AppRoutes.homePage);
          // Navigator.pushNamed(context, AppRoutes.homePage);
        },
        next: Text("Next"),
      ),
    );
  }
}
