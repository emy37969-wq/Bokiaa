import 'package:bloc/bloc.dart';
import 'package:bokiaa/feature/auth/data/repo/auth-repo.dart';
import 'package:bokiaa/feature/profile/cupit/profile_state.dart';
import 'package:bokiaa/feature/profile/data/profile_model.dart';
import 'package:bokiaa/feature/profile/data/profile_repo.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> getProfile() async {
    emit(GetProfileLoading());
    final response = await ProfileRepo.getProfile();
    if (isClosed) return;

    response == null
        ? emit(GetProfileError())
        : emit(GetProfileSuccess(response.data ?? ProfileData()));
  }

  Future<void> logout() async {
    emit(LogoutLoading());
    try {
      await Authrepo.logout();
      if (isClosed) return;
      emit(LogoutSuccess());
    } catch (e) {
      if (isClosed) return;
      emit(LogoutError());
    }
  }
}