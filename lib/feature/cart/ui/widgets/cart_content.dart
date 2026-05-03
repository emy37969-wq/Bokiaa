import 'package:bokiaa/feature/cart/data/repo/model/add_to_cart_model.dart';
import 'package:bokiaa/feature/cart/ui/widgets/cart_checkout_bar.dart';
import 'package:bokiaa/feature/cart/ui/widgets/cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartContent extends StatelessWidget {
  const CartContent({super.key, required this.cart});

  final CartData cart;

  @override
  Widget build(BuildContext context) {
    final items = cart.cartItems ?? [];
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            itemCount: items.length,
            separatorBuilder: (_, index) => SizedBox(height: 12.h),
            itemBuilder: (_, index) => CartItemCard(item: items[index]),
          ),
        ),
        CartCheckoutBar(total: cart.total ?? '0'),
      ],
    );
  }
}