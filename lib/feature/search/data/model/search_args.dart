import 'package:bokiaa/feature/cart/cupit/cart_cupit.dart';
import 'package:bokiaa/feature/wishlistt/cupit/wishlist_cupit.dart';

class SearchArgs {
  final CartCubit cartCubit;
  final WishlistCubit wishlistCubit;

  const SearchArgs({required this.cartCubit, required this.wishlistCubit});
}