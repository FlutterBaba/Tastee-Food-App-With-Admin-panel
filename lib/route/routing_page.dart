import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoutingPage {
  static goTonext({required BuildContext context, required Widget navigateTo}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => navigateTo,
      ),
    );
  }
}
