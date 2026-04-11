import 'package:bloc/bloc.dart';
import 'package:bokiaa/feature/search/cupit/search-state.dart';
import 'package:bokiaa/feature/search/data/search-repo.dart';

class Searchcupit extends Cubit<Searchstate> {
  Searchcupit() : super(searchInitial());

  search(String text) async {
    emit(searchLoadingState());
    final response = await Searchrepo.search(Text: text);
    if (response != null) {
      emit(searchSuccessState(response.data?.products ?? []));
    } else {
      emit(searcherrorState());
    }
  }
}
