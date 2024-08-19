import 'package:flutter/cupertino.dart';

class ResponsiveConstants {
  static const int maxMobileWidth = 650;
  static const int maxTabletWidth = 1210;
}

class Responsive {
  static isMobile(context) =>
      MediaQuery.of(context).size.width < ResponsiveConstants.maxMobileWidth;
  static isTablet(context) =>
      MediaQuery.of(context).size.width >= ResponsiveConstants.maxMobileWidth &&
      MediaQuery.of(context).size.width < ResponsiveConstants.maxTabletWidth;
  static isDesktop(context) =>
      MediaQuery.of(context).size.width >= ResponsiveConstants.maxTabletWidth;
}
