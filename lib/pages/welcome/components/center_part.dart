import 'package:flutter/material.dart';

class CenterPart extends StatelessWidget {
  const CenterPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset("images/logo.jpg"),
    );
  }
}
