import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String fullName;
  final String emailAddress;
  final String password;
  final String userUid;
  UserModel({
    required this.fullName,
    required this.emailAddress,
    required this.password,
    required this.userUid,
  });

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      fullName: doc['fullName'],
      emailAddress: doc['emailAdress'],
      password: doc['password'],
      userUid: doc['userUid'],
    );
  }
}
