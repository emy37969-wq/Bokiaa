// import 'package:bloc/bloc.dart';
// import 'package:bokiaa/feature/search/cupit/search-state.dart';
// import 'package:bokiaa/feature/search/data/search-repo.dart';

// class Searchcupit extends Cubit<Searchstate> {
//   Searchcupit() : super(searchInitial());

//   search(String text) async {
//     emit(searchLoadingState());
//     final response = await Searchrepo.search(Text: text);
//     if (response != null) {
//       emit(searchSuccessState(response.data?.products ?? []));
//     } else {
//       emit(searcherrorState());
//     }
//   }
// }

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bokiaa/feature/search/cupit/search-state.dart';
import 'package:bokiaa/feature/search/data/search-repo.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  Timer? _debounce;
  String _lastQuery = '';

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    if (query.trim().isEmpty) {
      _lastQuery = '';
      emit(SearchInitial());
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.trim() == _lastQuery) return;
      _lastQuery = query.trim();
      _executeSearch(_lastQuery);
    });
  }

  Future<void> _executeSearch(String query) async {
    emit(SearchLoading());
    final (response, error) = await SearchRepo.searchBooks(query);
    if (isClosed) return;

    if (response == null) {
      emit(SearchError(message: error ?? 'Search failed.'));
    } else {
      final books = response.data?.products ?? [];
      books.isEmpty ? emit(SearchEmpty()) : emit(SearchSuccess(books));
    }
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
