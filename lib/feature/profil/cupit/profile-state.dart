import 'package:bokiaa/feature/profil/data/model/profile-model.dart';

sealed class Profilestate {}

final class ProfileInitial extends Profilestate {}

abstract class GetProfileState extends Profilestate {}

final class GetProfileLoading extends GetProfileState {}

final class GetProfileSuccess extends GetProfileState {
  final ProfileModel profile;
  GetProfileSuccess(this.profile);
}

final class GetProfileError extends GetProfileState {
  final String message;
  GetProfileError({this.message = 'Failed to load profile'});
}

// // ─── Logout ──────────────────────────────────
abstract class LogoutState extends Profilestate {}

final class LogoutLoading extends LogoutState {}

final class LogoutSuccess extends LogoutState {}

final class LogoutError extends LogoutState {
  final String message;
  LogoutError({this.message = 'Failed to logout. Please try again.'});
}


