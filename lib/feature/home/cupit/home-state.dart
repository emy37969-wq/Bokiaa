
// part of 'hoime-cubit.dart';
// sealed class Homestate {

// }
// final class homeInitial extends Homestate {}
// final class sliderLoadingState extends Homestate {}

// final class sliderSucssesState extends Homestate {
//   final List<Slidermodel> sliders;
// sliderSucssesState(this.sliders);
// }
// final class sliderEroreState extends Homestate {

// }
import 'package:bokiaa/feature/home/data/models/best-seller-response.dart';
import 'package:bokiaa/feature/home/data/models/slider-model.dart';

sealed class Homestate {}

final class HomeInitial extends Homestate {}

final class SliderLoadingState extends Homestate {}

final class SliderSuccessState extends Homestate {
  final List<Slidermodel> sliders;
  SliderSuccessState(this.sliders);
}
final class SliderErrorState extends Homestate {}


final class BestsellerErrorState extends Homestate {}

final class BestsellerSuccessState extends Homestate {
  final List<product> products;
  BestsellerSuccessState(this.products);
}

final class BestsellerLoadingState extends Homestate {}

final class AddtocartSuccessState extends Homestate {}
final class AddtocartErrorState extends Homestate {}
final class AddtocartLoadingState extends Homestate {}
