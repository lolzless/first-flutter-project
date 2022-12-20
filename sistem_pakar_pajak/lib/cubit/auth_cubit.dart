import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sistem_pakar_pajak/models/user_model.dart';
import 'package:sistem_pakar_pajak/services/auth_service.dart';
import 'package:sistem_pakar_pajak/services/user_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signup(
      {required String email,
      required String password,
      required String name,
      String companyname = ''}) async {
    try {
      emit(AuthLoading());

      UserModel user = await AuthService().signup(
          email: email,
          password: password,
          name: name,
          companyname: companyname);

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signout() async {
    try {
      emit(AuthLoading());
      await AuthService().signout();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void getcurrentuser(String id) async {
    try {
      UserModel user = await UserService().getuserbyid(id);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
