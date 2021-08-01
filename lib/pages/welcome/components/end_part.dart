import 'package:flutter/material.dart';
import 'package:tasteefood/widgets/my_button.dart';

class EndPart extends StatelessWidget {
  const EndPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyButton(
          onPressed: (){},
          text: "LOG IN",
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            print("Click");
          },
          child: Text(
            "SIGNUP",
            style: TextStyle(color: Color(0xff797b7a)),
          ),
        )
      ],
    );
  }
}
