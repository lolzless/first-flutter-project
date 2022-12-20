import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sistem_pakar_pajak/models/user_model.dart';

class UserService {
  CollectionReference _userreference =
      FirebaseFirestore.instance.collection('users');
  Future<void> setuser(UserModel user) async {
    try {
      _userreference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'companyname': user.companyname,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> getuserbyid(String id) async {
    try {
      DocumentSnapshot snapshot = await _userreference.doc(id).get();
      return UserModel(
        id: id,
        email: snapshot['email'],
        name: snapshot['name'],
        companyname: snapshot['companyname'],
      );
    } catch (e) {
      throw e;
    }
  }
}
