
// // import 'package:bokiaa/feature/cart/data/repo/add_to_cart_repo.dart';
// // import 'package:bokiaa/feature/home/cupit/home-state.dart';
// // import 'package:bokiaa/feature/home/data/models/best-seller-response.dart';
// // import 'package:bokiaa/feature/home/data/models/slider-model.dart';
// // import 'package:bokiaa/feature/home/data/repo/home-repo.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';

// // class HomeCubit extends Cubit<Homestate> {
// //   HomeCubit() : super(HomeInitial());
// //   getslider() async {
// //     emit(SliderLoadingState());
// //     final SliderResponse? response = await Homerepo.getSliders();
// //     if (!isClosed &&  response != null) {
// //       emit(SliderSuccessState(response.sliders));
// //     } else {
// //       emit(SliderErrorState());
// //     }
// //   }
// //     getbestseeler() async {
// //     emit(SliderLoadingState());
// //     final Bestsellerresponse? response = await Homerepo.getbestseller();
// //     if (response != null) {
// //       emit(BestsellerSuccessState(response.data?.products??[]));
// //     } else {
// //       emit(BestsellerErrorState());
// //     }
// //   }
// //   addtocart(int productid) async {
// //     emit(AddtocartLoadingState());
// //     final  response = await CartRepo.addToCart(productid);
// //     if (response.$1 != null) {
// //       emit(AddtocartSuccessState());
// //     } else {
// //       emit(AddtocartErrorState());
// //     }
// //   }

// // }

// import 'package:bloc/bloc.dart';
// import 'package:bokiaa/feature/home/cupit/home-state.dart';
// import 'package:bokiaa/feature/home/data/repo/home_slider_repo.dart';
// import 'package:bookia/feature/home/data/models/books_model.dart';
// import 'package:bookia/feature/home/data/models/home_slider_model.dart';
// import 'package:bookia/feature/home/data/repo/home_slider_repo.dart';
// import 'package:meta/meta.dart';

// part 'home_state.dart';

// class HomeCubit extends Cubit<HomeState> {
//   HomeCubit() : super(HomeInitial());

//   Future<void> getHomeSliders() async {
//     emit(GetHomeSliderLoading());
//     final (response, error) = await HomeRepo.getHomeSliders();
//     if (isClosed) return;

//     response == null
//         ? emit(GetHomeSliderError(message: error ?? 'Failed to load sliders.'))
//         : emit(GetHomeSliderSuccess(response.data?.sliders ?? []));
//   }

//   Future<void> getBestSellerBooks() async {
//     emit(BestSellerLoading());
//     final (response, error) = await HomeRepo.getBestSellerBooks();
//     if (isClosed) return;

//     response == null
//         ? emit(
//             BestSellerError(message: error ?? 'Failed to load best sellers.'),
//           )
//         : emit(BestSellerSuccess(response.data?.products ?? []));
//   }

//   Future<void> getHomeData() async {
//     await Future.wait([getHomeSliders(), getBestSellerBooks()]);
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:bokiaa/feature/home/cupit/home-state.dart';
import 'package:bokiaa/feature/home/data/repo/home_slider_repo.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> getHomeSliders() async {
    emit(GetHomeSliderLoading());
    final (response, error) = await HomeRepo.getHomeSliders();
    if (isClosed) return;

    response == null
        ? emit(GetHomeSliderError(message: error ?? 'Failed to load sliders.'))
        : emit(GetHomeSliderSuccess(response.data?.sliders ?? []));
  }

  Future<void> getBestSellerBooks() async {
    emit(BestSellerLoading());
    final (response, error) = await HomeRepo.getBestSellerBooks();
    if (isClosed) return;

    response == null
        ? emit(
            BestSellerError(message: error ?? 'Failed to load best sellers.'),
          )
        : emit(BestSellerSuccess(response.data?.products ?? []));
  }

  Future<void> getHomeData() async {
    await Future.wait([getHomeSliders(), getBestSellerBooks()]);
  }
}
