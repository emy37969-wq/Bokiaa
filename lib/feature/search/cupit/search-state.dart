import 'package:bokiaa/feature/home/data/models/best-seller-response.dart';

sealed class Searchstate {}

final class searchInitial extends Searchstate {}

final class searchLoadingState extends Searchstate {}

final class searchSuccessState extends Searchstate {
  final List<product>? products;
  searchSuccessState(this.products);
}
final class searcherrorState extends Searchstate {}