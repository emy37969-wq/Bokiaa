import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bokiaa/feature/auth/data/repo/auth-repo.dart';
part 'auth-state.dart';

class Authcubit extends Cubit<Authstate> {
  Authcubit() : super(AuthInitial());
  Future<void> login({required String email, required String password}) async {
    emit(AuthLoadingState());
    final bool response =
        await Authrepo.login(email: email, password: password);
    if (response) {
      emit(AuthSucssesState());
    } else {
      emit(AuthErroeState());
    }
  }

  Future<void> register(
      {required String email,
      required String username,
      required String password,
      required String confirmpassword}) async {
    emit(AuthLoadingState());
    final bool response = await Authrepo.register(
        email: email,
        name: username,
        password: password,
        password_confirmation: confirmpassword);
    if (response) {
      emit(AuthSucssesState());
    } else {
      emit(AuthErroeState());
    }
  }
}
