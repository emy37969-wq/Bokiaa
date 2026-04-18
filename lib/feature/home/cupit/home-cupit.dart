
import 'package:bokiaa/feature/cart/data/repo/cart-repo.dart';
import 'package:bokiaa/feature/home/cupit/home-state.dart';
import 'package:bokiaa/feature/home/data/models/best-seller-response.dart';
import 'package:bokiaa/feature/home/data/models/slider-model.dart';
import 'package:bokiaa/feature/home/data/repo/home-repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<Homestate> {
  HomeCubit() : super(HomeInitial());
  getslider() async {
    emit(SliderLoadingState());
    final SliderResponse? response = await Homerepo.getSliders();
    if (!isClosed &&  response != null) {
      emit(SliderSuccessState(response.sliders));
    } else {
      emit(SliderErrorState());
    }
  }
    getbestseeler() async {
    emit(SliderLoadingState());
    final Bestsellerresponse? response = await Homerepo.getbestseller();
    if (response != null) {
      emit(BestsellerSuccessState(response.data?.products??[]));
    } else {
      emit(BestsellerErrorState());
    }
  }
  addtocart(int productid) async {
    emit(AddtocartLoadingState());
    final  response = await Cartrepo.addtocart(productid);
    if (response) {
      emit(AddtocartSuccessState());
    } else {
      emit(AddtocartErrorState());
    }
  }

}
