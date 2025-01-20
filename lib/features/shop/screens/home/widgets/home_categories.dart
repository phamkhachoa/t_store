import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:t_store/features/shop/screens/home/bloc/home_bloc.dart';
import 'package:t_store/features/shop/screens/home/bloc/home_state.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return SizedBox(
        height: 90,
        child: state.isLoadingPopularCategory
            ? Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.5),
                highlightColor: Colors.white,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                              width: 56,
                              height: 57,
                              padding: const EdgeInsets.all(TSizes.sm),
                              // margin: const EdgeInsets.all(TSizes.sm),
                              decoration: BoxDecoration(
                                  color: THelperFunctions.isDarkMode(context)
                                      ? TColors.black.withOpacity(0.2)
                                      : TColors.white,
                                  borderRadius: BorderRadius.circular(100))),
                          const SizedBox(
                            height: TSizes.spaceBtwItems / 2,
                          ),
                          SizedBox(
                            width: 40,
                            child: Container(
                              height: 9,
                                decoration: BoxDecoration(
                                    color: THelperFunctions.isDarkMode(context)
                                        ? TColors.black.withOpacity(0.2)
                                        : TColors.white,
                                    borderRadius: BorderRadius.circular(20))
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: state.popularCategories?.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return TVerticalImageText(
                    image: TImages.shoeIcon,
                    title: 'Shoes',
                    onTap: () {},
                  );
                },
              ),
      );
    });
  }
}
