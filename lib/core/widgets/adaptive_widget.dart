import 'package:flutter/material.dart';

class AdaptiveWidget extends StatelessWidget {
  const AdaptiveWidget({
    Key? key,
    required this.mobile,
    required this.desktop,
  }) : super(key: key);
  final Widget mobile;
  final Widget desktop;
  static const double mobileMaxWidth = 650;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width >= mobileMaxWidth) {
      return desktop;
    } else {
      return mobile;
    }
  }
}
