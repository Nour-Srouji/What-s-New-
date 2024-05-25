import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class ShowVariables extends ChangeNotifier {
  late String _q;

  ShowVariables({required String q}) {
    _q = q;
  }

  String get q => _q;

  set q(String value) {
    _q = value;
    notifyListeners();
  }
}
