import 'package:flutter/material.dart';

class HomeController {
  late BuildContext context;

  init(BuildContext context) {
    this.context = context;
  }

  void goToOptionPage(String option) {
    if (option == 'register') {
      Navigator.pushNamed(context, 'register');
    } else {
      Navigator.pushNamed(context, 'datos');
    }
  }
}
