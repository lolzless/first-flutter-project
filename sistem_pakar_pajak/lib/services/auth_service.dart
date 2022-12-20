import 'package:firebase_auth/firebase_auth.dart';
import 'package:sistem_pakar_pajak/models/user_model.dart';
import 'package:sistem_pakar_pajak/services/user_service.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      UserModel user =
          await UserService().getuserbyid(userCredential.user!.uid);
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> signup({
    required String email,
    required String password,
    required String name,
    String companyname = '',
  }) async {
    try {
      UserCredential usercredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel user = UserModel(
        id: usercredential.user!.uid,
        email: email,
        name: name,
        companyname: companyname,
      );

      await UserService().setuser(user);

      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<void> signout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw e;
    }
  }
}
