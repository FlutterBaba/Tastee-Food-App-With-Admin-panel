import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasteefood/widgets/my_button.dart';
import 'package:tasteefood/widgets/single_cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyButton(
        text: "Check Out",
        onPressed: () {},
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("cart")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("userCart")
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshort) {
          if (!streamSnapshort.hasData) {
            return Center(child: const CircularProgressIndicator());
          }
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: streamSnapshort.data!.docs.length,
            itemBuilder: (ctx, index) {
              var data = streamSnapshort.data!.docs[index];
              return SingleCartItem(
                productId: data["productId"],
                productCategory: data["productCategory"],
                productImage: data["productImage"],
                productPrice: data["productPrice"],
                productQuantity: data["productQuantity"],
                productName: data["productName"],
              );
            },
          );
        },
      ),
    );
  }
}
