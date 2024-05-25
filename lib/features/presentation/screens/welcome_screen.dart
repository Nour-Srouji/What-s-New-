import 'package:flutter/material.dart';

import 'home/first_interface.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);
  late final BuildContext cx;
  @override
  Widget build(BuildContext context) {
    cx = context;
    return Scaffold(
      body: FutureBuilder(
        future: sleep(2),
        builder: (cx, snapshot) => Center(
          child: Image.asset(
            "assets/images/welcome.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Future<void> sleep(int timer) async {
    await Future.delayed(Duration(seconds: timer));
    Navigator.of(cx).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => FirstInterface()));
  }
}
