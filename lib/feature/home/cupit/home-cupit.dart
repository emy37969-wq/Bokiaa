
import 'package:bokiaa/feature/home/cupit/home-state.dart';
import 'package:bokiaa/feature/home/data/repo/home-repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<Homestate> {
  HomeCubit() : super(HomeInitial());
  getslider() async {
    emit(SliderLoadingState());
    final response = await Homerepo.getslider();
    if (response != null) {
      emit(SliderSuccessState(response.data.sliders??[]));
    } else {
      emit(SliderErrorState());
    }
  }
}
