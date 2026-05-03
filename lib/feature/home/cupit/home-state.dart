
// // // part of 'hoime-cubit.dart';
// // // sealed class Homestate {

// // // }
// // // final class homeInitial extends Homestate {}
// // // final class sliderLoadingState extends Homestate {}

// // // final class sliderSucssesState extends Homestate {
// // //   final List<Slidermodel> sliders;
// // // sliderSucssesState(this.sliders);
// // // }
// // // final class sliderEroreState extends Homestate {

// // // }
// // import 'package:bokiaa/feature/home/data/models/best-seller-response.dart';
// // import 'package:bokiaa/feature/home/data/models/slider-model.dart';

// // sealed class Homestate {}

// // final class HomeInitial extends Homestate {}

// // final class SliderLoadingState extends Homestate {}

// // final class SliderSuccessState extends Homestate {
// //   final List<Slidermodel> sliders;
// //   SliderSuccessState(this.sliders);
// // }
// // final class SliderErrorState extends Homestate {}


// // final class BestsellerErrorState extends Homestate {}

// // final class BestsellerSuccessState extends Homestate {
// //   final List<product> products;
// //   BestsellerSuccessState(this.products);
// // }

// // final class BestsellerLoadingState extends Homestate {}

// // final class AddtocartSuccessState extends Homestate {}
// // final class AddtocartErrorState extends Homestate {}
// // final class AddtocartLoadingState extends Homestate {}

// part of 'home_cubit.dart';

// @immutable
// sealed class HomeState {}

// final class HomeInitial extends HomeState {}

// // ─── Slider States ───────────────────────────────────────

// abstract class GetHomeSliderState extends HomeState {}

// final class GetHomeSliderLoading extends GetHomeSliderState {}

// final class GetHomeSliderSuccess extends GetHomeSliderState {
//   final List<SliderImages> sliders;

//   GetHomeSliderSuccess(this.sliders);
// }

// final class GetHomeSliderError extends GetHomeSliderState {
//   final String message;

//   GetHomeSliderError({this.message = 'Failed to load sliders'});
// }

// // ─── Best Seller States ──────────────────────────────────

// abstract class BestSellerState extends HomeState {}

// final class BestSellerLoading extends BestSellerState {}

// final class BestSellerSuccess extends BestSellerState {
//   final List<Products> books;

//   BestSellerSuccess(this.books);
// }

// final class BestSellerError extends BestSellerState {
//   final String message;

//   BestSellerError({this.message = 'Failed to load best sellers'});
// }


import 'package:bokiaa/feature/home/data/models/books_model.dart';
import 'package:bokiaa/feature/home/data/models/home_slider_model.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

// ─── Slider States ───────────────────────────────────────

abstract class GetHomeSliderState extends HomeState {}

final class GetHomeSliderLoading extends GetHomeSliderState {}

final class GetHomeSliderSuccess extends GetHomeSliderState {
  final List<SliderImages> sliders;

  GetHomeSliderSuccess(this.sliders);
}

final class GetHomeSliderError extends GetHomeSliderState {
  final String message;

  GetHomeSliderError({this.message = 'Failed to load sliders'});
}

// ─── Best Seller States ──────────────────────────────────

abstract class BestSellerState extends HomeState {}

final class BestSellerLoading extends BestSellerState {}

final class BestSellerSuccess extends BestSellerState {
  final List<Products> books;

  BestSellerSuccess(this.books);
}

final class BestSellerError extends BestSellerState {
  final String message;

  BestSellerError({this.message = 'Failed to load best sellers'});
}