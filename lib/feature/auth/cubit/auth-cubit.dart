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
      emit(AuthEroreState());
    }
  }

  Future<void> register(
      {required String email,
      required String name,
      required String password,
      required String password_confirmation}) async {
    emit(AuthLoadingState());
    final bool response = await Authrepo.register(
        email: email,
        name: name,
        password: password,
        password_confirmation: password_confirmation);
    if (response) {
      emit(AuthSucssesState());
    } else {
      emit(AuthEroreState());
    }
  }
}
