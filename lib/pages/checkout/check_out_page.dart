import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasteefood/appColors/app_colors.dart';
import 'package:tasteefood/widgets/my_button.dart';
import 'package:tasteefood/widgets/single_cart_item.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Check out",
          style: TextStyle(
            color: AppColors.KblackColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
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
          ),
          Expanded(
            child: Column(
              children: [
                ListTile(
                  leading: Text("Sub Title"),
                  trailing: Text("\$123"),
                ),
                ListTile(
                  leading: Text("Discount"),
                  trailing: Text("%5"),
                ),
                ListTile(
                  leading: Text("Shiping"),
                  trailing: Text("\$10"),
                ),
                Divider(
                  thickness: 2,
                ),
                ListTile(
                  leading: Text("Total"),
                  trailing: Text("\$500"),
                ),
                MyButton(
                  onPressed: () => print("button"),
                  text: "Buy",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
