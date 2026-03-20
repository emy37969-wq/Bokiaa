
part of 'auth-cubit.dart';
sealed class Authstate {

}
final class AuthInitial extends Authstate {}
final class authsucssesstate extends Authstate {}
final class autherroestate extends Authstate {}
final class authloadingstate extends Authstate {}