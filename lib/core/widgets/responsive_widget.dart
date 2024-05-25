import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget smallMobile;
  final Widget mediumMobile;
  final Widget desktop;
  final double mobileWidth;
  static const double smallMobileMaxWidth = 400;
  static const double mediumMobileMaxWidth = 650;
  const ResponsiveWidget(
      {Key? key,
      required this.smallMobile,
      required this.mediumMobile,
      required this.desktop,
      required this.mobileWidth})
      : super(key: key);

  static bool isSmallMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < smallMobileMaxWidth;
  }

  static bool isMediumMobile(BuildContext context) {
    return MediaQuery.of(context).size.width > smallMobileMaxWidth &&
        MediaQuery.of(context).size.width < mediumMobileMaxWidth;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= mediumMobileMaxWidth;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= smallMobileMaxWidth) {
          return smallMobile;
        } else if (constraints.maxWidth >= mediumMobileMaxWidth) {
          return mediumMobile;
        } else {
          return desktop;
        }
      },
    );
  }
}
