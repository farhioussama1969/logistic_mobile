import 'package:flutter/cupertino.dart';

class NavigatorService {
  static void toNamed(BuildContext context, {required String route}) {
    Navigator.pushNamed(context, route);
  }

  static void offAllNamed(BuildContext context, {required String route}) {
    Navigator.pushNamedAndRemoveUntil(context, route, (Route<dynamic> route) => false);
  }

  static void back(BuildContext context) {
    Navigator.pop(context);
  }
}
