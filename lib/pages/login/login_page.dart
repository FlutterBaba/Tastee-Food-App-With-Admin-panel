import 'package:flutter/material.dart';
import 'package:tasteefood/pages/login/components/center_part.dart';
import 'package:tasteefood/pages/login/components/end_part.dart';
import 'package:tasteefood/pages/login/components/top_part.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // top part/
            TopPart(),
            // center part

            CenterPart(),

            /// end part
            EndPart(),
          ],
        ),
      ),
    );
  }
}
