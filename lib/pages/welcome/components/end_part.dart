import 'package:flutter/material.dart';
import 'package:tasteefood/appColors/app_colors.dart';
import 'package:tasteefood/pages/login/login_page.dart';
import 'package:tasteefood/pages/signup/signup_page.dart';
import 'package:tasteefood/route/routing_page.dart';
import 'package:tasteefood/widgets/my_button.dart';

class EndPart extends StatelessWidget {
  const EndPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyButton(
          onPressed: () {
            RoutingPage.goTonext(
              context: context,
              navigateTo: LoginPage(),
            );
          },
          text: "LOG IN",
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            RoutingPage.goTonext(
              context: context,
              navigateTo: SignupPage(),
            );
          },
          child: Text(
            "SIGNUP",
            style: TextStyle(
              color: AppColors.KgreyColor,
            ),
          ),
        )
      ],
    );
  }
}
