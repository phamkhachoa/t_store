import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/shop/screens/home/bloc/home_event.dart';
import 'package:t_store/features/shop/screens/home/bloc/home_state.dart';

import '../../../../../utils/constants/image_strings.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<SliderFetchEvent>(_sliderFetch);
    on<PopularCategoryFetchEvent>(_popularCategoryFetch);
    on<LoginSuccessEvent>(_onLoginSuccess);
  }

  void _sliderFetch(SliderFetchEvent event, Emitter<HomeState> emit) async {
    var res = await Future.delayed(Duration(seconds: 10), () {
      print('Loaded slider list1');
    });

    List<String> sliders = [
      "https://extrim.vn/_next/image?url=https%3A%2F%2Fextrim-prod.s3.ap-southeast-1.amazonaws.com%2Fgiay_nike_3d0eb1039f.jpg&w=3840&q=75",
      "https://ichef.bbci.co.uk/ace/standard/976/cpsprodpb/B9FF/production/_117751674_satan-shoes1.jpg",
      "https://authentic-shoes.com/wp-content/uploads/2023/05/nike-air-force-1-low-cz0326-100-07_db8f5c0d7afe4148ae0172339956f50c_2048x2048.jpg",
    ];

    emit(state.copyWith(sliders: sliders, isLoadingSlider: false));
  }

  void _popularCategoryFetch(
      PopularCategoryFetchEvent event, Emitter<HomeState> emit) async {
    var res = await Future.delayed(Duration(seconds: 10), () {
      print('Loaded slider list1');
    });

    List<String> categories = [
      TImages.promoBanner1,
      TImages.promoBanner2,
      TImages.promoBanner3,
      TImages.promoBanner1,
      TImages.promoBanner2,
      TImages.promoBanner3
    ];

    emit(state.copyWith(popularCategories: categories, isLoadingPopularCategory: false));
  }

  // void _popupImagesFetch(
  //     LoadPopupEvent event, Emitter<HomeState> emit) async {
  //   var res = await Future.delayed(Duration(seconds: 1), () {
  //     print('Loaded slider list1');
  //   });
  //
  //   List<String> imagesPopups = [
  //     "https://m.media-amazon.com/images/I/614aiM56siL._AC_UY1000_.jpg",
  //     "https://ca-times.brightspotcdn.com/dims4/default/15a30ea/2147483647/strip/true/crop/6122x4081+0+1/resize/1440x960!/quality/75/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Fb3%2F10%2F10c245034893adf233fc1cf3071a%2F1351750-fi-sneaker-buyer-coolkicks-jlc-16185-021.jpg",
  //     "https://img.freepik.com/premium-vector/vector-pair-sneakers-with-vibrant-yellow-blue-laces-representing-style-individuality_410516-100324.jpg",
  //   ];
  //
  //   emit(state.copyWith(imagesPopups: imagesPopups));
  // }

  void _onLoginSuccess(LoginSuccessEvent event, Emitter<HomeState> emit) async {
    // add event
    add(SliderFetchEvent());
    add(PopularCategoryFetchEvent());
  }
}
