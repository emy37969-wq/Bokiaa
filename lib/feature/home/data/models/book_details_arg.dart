import 'package:bokiaa/feature/cart/cupit/cart_cupit.dart';
import 'package:bokiaa/feature/home/data/models/books_model.dart';
import 'package:bokiaa/feature/wishlistt/cupit/wishlist_cupit.dart';

class BookDetailsArgs {
  final Products book;
  final CartCubit cartCubit;
  final WishlistCubit wishlistCubit;

  const BookDetailsArgs({
    required this.book,
    required this.cartCubit,
    required this.wishlistCubit,
  });
}