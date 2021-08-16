import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasteefood/pages/home/home_page.dart';
import 'package:tasteefood/pages/login/login_page.dart';
import 'package:tasteefood/pages/profile/profile_page.dart';
import 'package:tasteefood/route/routing_page.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            accountName: Text(userModel.fullName),
            accountEmail: Text(userModel.emailAddress),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("images/non_profile.jpg"),
            ),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {
                RoutingPage.goTonext(
                  context: context,
                  navigateTo: ProfilePage(),
                );
              },
              icon: Icon(
                Icons.person,
              ),
            ),
            title: Text("Profile"),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_rounded,
              ),
            ),
            title: Text("Cart"),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
              ),
            ),
            title: Text("Favorite"),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_basket_sharp,
              ),
            ),
            title: Text("My Order"),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then(
                      (value) => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      ),
                    );
              },
              icon: Icon(
                Icons.exit_to_app,
              ),
            ),
            title: Text("Log out"),
          )
        ],
      ),
    );
  }
}
