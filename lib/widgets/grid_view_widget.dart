import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tasteefood/appColors/app_colors.dart';
import 'package:tasteefood/pages/detailPage/details_page.dart';
import 'package:tasteefood/route/routing_page.dart';

import 'single_product.dart';

class GridViewWidget extends StatelessWidget {
  final String id;
  final String collection;
  final String subCollection;

  const GridViewWidget({
    Key? key,
    required this.subCollection,
    required this.id,
    required this.collection,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(id);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(collection)
            .doc(id)
            .collection(subCollection)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshort) {
          if (!snapshort.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 7,
                  shadowColor: Colors.grey[300],
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      fillColor: AppColors.KwhiteColor,
                      hintText: "Search Your Product",
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              snapshort.data!.docs.isEmpty
                  ? Text("No Item")
                  : GridView.builder(
                      shrinkWrap: true,
                      itemCount: snapshort.data!.docs.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.4,
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                      ),
                      itemBuilder: (context, index) {
                        var data = snapshort.data!.docs[index];
                        return SingleProduct(
                          onTap: () {
                            RoutingPage.goTonext(
                              context: context,
                              navigateTo: DetailsPage(
                                productCategory: data["productCategory"],
                                productId: data["productId"],
                                productDescription: data["productDescription"],
                                productImage: data["productImage"],
                                productName: data["productName"],
                                productOldPrice: data["productOldPrice"],
                                productPrice: data["productPrice"],
                                productRate: data["productRate"],
                              ),
                            );
                          },
                          productId: data["productId"],
                          productCategory: data["productCategory"],
                          productRate: data["productRate"],
                          productOldPrice: data["productOldPrice"],
                          productPrice: data["productPrice"],
                          productImage: data["productImage"],
                          productName: data["productName"],
                        );
                      },
                    ),
            ],
          );
        },
      ),
    );
  }
}
