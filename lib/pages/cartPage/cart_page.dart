import 'package:flutter/material.dart';
import 'package:tasteefood/widgets/my_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyButton(
        text: "Check Out",
        onPressed: (){},
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(20.0),
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 7,
                )
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("images/logo.jpg"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Salad",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Food",
                        ),
                        Text(
                          "\$ 25",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IncrementAndDecrement(
                              icon: Icons.add,
                              onPressed: () {},
                            ),
                            IncrementAndDecrement(
                              icon: Icons.remove,
                              onPressed: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IncrementAndDecrement extends StatelessWidget {
  final Function()? onPressed;
  final IconData icon;
  const IncrementAndDecrement({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 40,
      height: 30,
      elevation: 2,
      color: Colors.grey[300],
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(icon),
    );
  }
}
