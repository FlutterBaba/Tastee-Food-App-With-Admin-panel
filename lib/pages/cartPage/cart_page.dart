import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasteefood/pages/checkout/check_out_page.dart';
import 'package:tasteefood/route/routing_page.dart';
import 'package:tasteefood/widgets/my_button.dart';
import 'package:tasteefood/widgets/single_cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyButton(
        text: "Check Out",
        onPressed: () {
          RoutingPage.goTonext(
            context: context,
            navigateTo: CheckOutPage(),
          );
        },
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
          return streamSnapshort.data!.docs.isEmpty
              ? Center(
                  child: Text(" No Cart"),
                )
              : ListView.builder(
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
