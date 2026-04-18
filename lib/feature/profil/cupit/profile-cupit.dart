import 'package:bloc/bloc.dart';
import 'package:bokiaa/feature/auth/data/repo/auth-repo.dart';
import 'package:bokiaa/feature/profil/cupit/profile-state.dart';
import 'package:bokiaa/feature/profil/data/model/profile-model.dart';
import 'package:bokiaa/feature/profil/data/profile-repo.dart';

class ProfileCubit extends Cubit<Profilestate> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> getProfile() async {
    emit(GetProfileLoading());
    final response = await ProfileRepo.getProfile();
    if (isClosed) return;

    response == null
        ? emit(GetProfileError())
        : emit(GetProfileSuccess((response.data ?? ProfileData()) as ProfileModel));
  }

  // Future<void> logout() async {
  //   emit(LogoutLoading());
  //   try {
  //     await Authrepo.logout();
  //     if (isClosed) return;
  //     emit(LogoutSuccess());
  //   } catch (e) {
  //     if (isClosed) return;
  //     emit(LogoutError());
  //   }
  // }
}