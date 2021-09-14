import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasteefood/widgets/my_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text("Forgot Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: "Email"),
              onChanged: (value) {
                setState(() {
                  email = value.trim();
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            MyButton(
              onPressed: () async {
                await FirebaseAuth.instance
                    .sendPasswordResetEmail(email: email!)
                    .whenComplete(
                      () => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "An email has been send $email to please verify",
                          ),
                        ),
                      ),
                    );
                Navigator.pop(context);
              },
              text: "Send Request",
            )
          ],
        ),
      ),
    );
  }
}