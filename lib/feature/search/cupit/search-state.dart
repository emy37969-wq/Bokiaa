// import 'package:bokiaa/feature/home/data/models/best-seller-response.dart';

// sealed class Searchstate {}

// final class searchInitial extends Searchstate {}

// final class searchLoadingState extends Searchstate {}

// final class searchSuccessState extends Searchstate {
//   final List<product>? products;
//   searchSuccessState(this.products);
// }

// final class searcherrorState extends Searchstate {}



import 'package:bokiaa/feature/home/data/models/books_model.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<Products> books;

  SearchSuccess(this.books);
}

final class SearchEmpty extends SearchState {}

final class SearchError extends SearchState {
  final String message;

  SearchError({this.message = 'Something went wrong. Please try again.'});
}