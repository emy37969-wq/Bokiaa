
part of 'auth-cubit.dart';
sealed class Authstate {

}
final class AuthInitial extends Authstate {}
final class AuthSucssesState extends Authstate {}
final class AuthErroeState extends Authstate {}
final class AuthLoadingState extends Authstate {}
