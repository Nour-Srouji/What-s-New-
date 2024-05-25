// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  List<int> i = [3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text(
          "First App",
        ),
        actions: [
          IconButton(
            onPressed: () {
              print("notification clicked");
            },
            icon: Icon(Icons.notification_important),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: onNotification,
          )
        ],
      ),
    );
  }

  void onNotification() {
    print("Hello!");
  }
}
