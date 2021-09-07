import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasteefood/appColors/app_colors.dart';
import 'package:tasteefood/model/user_model.dart';
import 'package:tasteefood/pages/detailPage/details_page.dart';
import 'package:tasteefood/route/routing_page.dart';
import 'package:tasteefood/widgets/build_drawer.dart';
import 'package:tasteefood/widgets/grid_view_widget.dart';
import 'package:tasteefood/widgets/single_product.dart';

late UserModel userModel;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future getCurrentUserDataFunction() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
      (DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          userModel = UserModel.fromDocument(documentSnapshot);
        } else {
          print("Document does not exist the database");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    getCurrentUserDataFunction();
    return Scaffold(
      drawer: BuildDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
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
          ListTile(
            leading: Text(
              "Categories",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[600],
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Container(
            height: 100,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("categories")
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshort) {
                if (!streamSnapshort.hasData) {
                  return Center(child: const CircularProgressIndicator());
                }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: streamSnapshort.data!.docs.length,
                  itemBuilder: (ctx, index) {
                    return Categories(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => GridViewWidget(
                              collection: streamSnapshort.data!.docs[index]
                                  ["categoryName"],
                              id: streamSnapshort.data!.docs[index].id,
                            ),
                          ),
                        );
                      },
                      categoryName: streamSnapshort.data!.docs[index]
                          ["categoryName"],
                      image: streamSnapshort.data!.docs[index]["categoryImage"],
                    );
                  },
                );
              },
            ),
          ),
          ListTile(
            leading: Text(
              "Products",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Container(
            height: 280,
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("products").snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshort) {
                if (!streamSnapshort.hasData) {
                  return Center(child: const CircularProgressIndicator());
                }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: streamSnapshort.data!.docs.length,
                  itemBuilder: (ctx, index) {
                    var data = streamSnapshort.data!.docs[index];
                    return SingleProduct(
                      onTap: () {
                        RoutingPage.goTonext(
                          context: context,
                          navigateTo: DetailsPage(
                            productCategory: data["productCategory"],
                            productId: data["productId"],
                            productImage: data["productImage"],
                            productName: data["productName"],
                            productOldPrice: data["productOldPrice"],
                            productPrice: data["productPrice"],
                            productRate: data["productRate"],
                            productDescription: data["productDescription"],
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
                );
              },
            ),
          ),
          ListTile(
            leading: Text(
              "Best Sell",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Container(
            height: 280,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("products")
                  .where("productRate", isGreaterThan: 4)
                  .orderBy(
                    "productRate",
                    descending: true,
                  )
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshort) {
                if (!streamSnapshort.hasData) {
                  return Center(child: const CircularProgressIndicator());
                }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: streamSnapshort.data!.docs.length,
                  itemBuilder: (ctx, index) {
                    var data = streamSnapshort.data!.docs[index];
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Categories extends StatelessWidget {
  final String image;
  final String categoryName;
  final Function()? onTap;
  const Categories({
    Key? key,
    required this.onTap,
    required this.categoryName,
    required this.image,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(12.0),
        height: 100,
        width: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              image,
            ),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black.withOpacity(0.7),
          ),
          child: Center(
            child: Text(
              categoryName,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
