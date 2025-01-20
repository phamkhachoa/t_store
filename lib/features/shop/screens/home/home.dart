import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/features/shop/screens/home/bloc/home_bloc.dart';
import 'package:t_store/features/shop/screens/home/bloc/home_state.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:t_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/device/device_utility.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import 'bloc/home_event.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // add fetch slider event
    BlocProvider.of<HomeBloc>(context).add(SliderFetchEvent());
    BlocProvider.of<HomeBloc>(context).add(PopularCategoryFetchEvent());
    super.initState();
  }

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
                        text: 'Search in Store1',
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
                                  borderRadius: BorderRadius.circular(TSizes.md)
                              ),
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
