import 'package:flutter/cupertino.dart';

class Responsive {
  static isMobile(context) => MediaQuery.of(context).size.width < 650;
  static isTablet(context) =>
      MediaQuery.of(context).size.width >= 650 &&
      MediaQuery.of(context).size.width < 1100;
  static isDesktop(context) => MediaQuery.of(context).size.width >= 1100;
}
