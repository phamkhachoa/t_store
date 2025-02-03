import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/popups/image_popup.dart';
import 'package:t_store/features/shop/screens/home/bloc/home_bloc.dart';
import 'package:t_store/features/shop/screens/home/bloc/home_state.dart';
import 'package:t_store/features/shop/screens/home/popup_bloc/popup_bloc.dart';
import 'package:t_store/features/shop/screens/home/popup_bloc/popup_event.dart';
import 'package:t_store/features/shop/screens/home/popup_bloc/popup_state.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:t_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import 'bloc/home_event.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PopupBloc, PopupState>(
          listener: (context, state) {
            var urls = state.imagesPopups;
            for (var value in urls) {
              _openPopupDialog(context, value);
            }
          },
          // child: HomePageBody(),
        )
      ],
      child: HomePageBody(),
    );
  }

  void _openPopupDialog(BuildContext context, String imageUrl) {
    showGeneralDialog(
        context: context,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, animation1, animation2) {
          return Container();
        },
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue =
              Curves.easeInOut.transform(a1.value); // Smooth animation
          return Transform.scale(
            scale: curvedValue,
            child: Opacity(
              opacity: a1.value,
              child: ImagePopup(imageUrl: imageUrl),
            ),
          );
        });
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                TPrimaryHeaderContainer(
                  child: Column(
                    children: [
                      const THomeAppBar(),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),
                      TSearchContainer(
                        text: 'Search in Store',
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: TSizes.defaultSpace),
                        child: Column(
                          children: [
                            TSectionHeading(
                              title: 'Popular Categories',
                              showActionButton: false,
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwItems,
                            ),
                            THomeCategories()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                /// Body
                Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: Column(
                      children: [
                        state.isLoadingSlider
                            ? Shimmer.fromColors(
                                baseColor: Colors.grey,
                                highlightColor: Colors.white,
                                child: Opacity(
                                  opacity: 0.2,
                                  child: Container(
                                    height: 150,
                                    width: 320,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(TSizes.md)),
                                  ),
                                ),
                              )
                            : TPromoSlider(
                                banners: state.sliders,
                              ),

                        const SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),

                        /// Heading
                        TSectionHeading(
                          title: 'Popular Products',
                          onPressed: () {},
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),

                        /// -- Popular Products
                        TGridLayout(
                          itemCount: 4,
                          itemBuilder: (_, index) => TProductCardVertical(),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
