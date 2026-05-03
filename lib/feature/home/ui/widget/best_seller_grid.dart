import 'package:bokiaa/feature/home/cupit/home-cupit.dart';
import 'package:bokiaa/feature/home/cupit/home-state.dart';
import 'package:bokiaa/feature/home/ui/widget/best_seller_skeleton.dart';
import 'package:bokiaa/feature/home/ui/widget/book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSellerGrid extends StatelessWidget {
  const BestSellerGrid({super.key});

  static const _gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 0.65,
    crossAxisSpacing: 12,
    mainAxisSpacing: 12,
  );

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      sliver: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => current is BestSellerState,
        builder: (context, state) {
          if (state is BestSellerLoading) {
            return BestSellerSkeletonGrid(gridDelegate: _gridDelegate);
          } else if (state is BestSellerSuccess) {
            return SliverGrid(
              gridDelegate: _gridDelegate,
              delegate: SliverChildBuilderDelegate(
                (context, index) => BookCard(books: state.books[index]),
                childCount: state.books.length,
              ),
            );
          } else if (state is BestSellerError) {
            return SliverToBoxAdapter(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(state.message),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () =>
                          context.read<HomeCubit>().getBestSellerBooks(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SliverToBoxAdapter(child: SizedBox.shrink());
          }
        },
      ),
    );
  }
}