import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState( {
    this.imagesPopups = const[],
    this.sliders = const [],
    this.popularCategories = const [],
    this.isLoadingSlider = true,
    this.isLoadingPopularCategory = true,
  });

  final List<String> sliders;
  final List<String> imagesPopups;
  final List<String>? popularCategories;
  final bool isLoadingSlider;
  final bool isLoadingPopularCategory;

  HomeState copyWith({
    List<String>? sliders,
    List<String>? imagesPopups,
    List<String>? popularCategories,
    bool? isLoadingSlider,
    bool? isLoadingPopularCategory,
  }) {
    var homeState = HomeState(
        sliders: sliders ?? this.sliders,
        isLoadingSlider: isLoadingSlider ?? this.isLoadingSlider,
        imagesPopups: imagesPopups ?? this.imagesPopups,
        isLoadingPopularCategory:
            isLoadingPopularCategory ?? this.isLoadingPopularCategory,
        popularCategories: popularCategories ?? this.popularCategories);
    return homeState;
  }

  @override
  List<Object?> get props =>
      [sliders, isLoadingSlider, isLoadingPopularCategory, popularCategories, imagesPopups];
}
