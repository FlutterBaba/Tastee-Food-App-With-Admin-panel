import 'package:flutter/material.dart';
import 'package:tasteefood/pages/home/home_page.dart';
import 'package:tasteefood/widgets/my_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEdit = false;

  Widget textFromField({required String hintText}) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: ListTile(
        leading: Text(hintText),
      ),
    );
  }

  Widget nonEditTextField() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/non_profile.jpg"),
              radius: 50,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        textFromField(hintText: userModel.fullName),
        SizedBox(
          height: 10,
        ),
        textFromField(hintText: userModel.emailAddress),
      ],
    );
  }

  Widget editTextField() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/non_profile.jpg"),
              radius: 50,
            ),
          ],
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: userModel.fullName,
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: userModel.emailAddress,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        MyButton(
          onPressed: () {},
          text: "Up date",
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: isEdit
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isEdit = false;
                  });
                },
                icon: Icon(Icons.close),
              )
            : IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                ),
              ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isEdit = true;
              });
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: isEdit ? editTextField() : nonEditTextField(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
