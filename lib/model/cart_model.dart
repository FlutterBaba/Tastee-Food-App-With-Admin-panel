import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {
  final String productId;
  final String productCategory;
  final String productImage;
  final double productPrice;
  final int productQuantity;
  final String productName;
  CartModel({
    required this.productCategory,
    required this.productId,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productQuantity,
  });
  factory CartModel.fromDocument(QueryDocumentSnapshot doc) {
    return CartModel(
      productId: doc["productId"],
      productCategory: doc["productCategory"],
      productImage: doc["productImage"],
      productPrice: doc["productPrice"],
      productQuantity: doc["productQuantity"],
      productName: doc["productName"],
    );
  }
}
