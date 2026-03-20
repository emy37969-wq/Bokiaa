import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bokiaa/feature/auth/data/repo/auth-repo.dart';
part 'auth-state.dart';



class Authcubit extends Cubit<Authstate> {
  Authcubit() : super(AuthInitial());

  Future<void> login(context,{required String email, required String password}) async {
    emit(authloadingstate());
    final Response? response = await Authrepo.login(email: email, password: password);
    
              showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Error"),
              content: Text(response!.statusCode.toString()!),
            ),
          );

    if (response!=null) {
      emit(authsucssesstate());
    } else {
      emit(autherroestate());
    }
  }
}
