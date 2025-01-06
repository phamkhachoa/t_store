import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/curverd_edges_widget.dart';
import '../../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.isDart,
  });

  final bool isDart;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidget(
        child: Container(
          color: isDart ? TColors.darkerGrey : TColors.light,
          child: Stack(
            children: [
              /// Main large Image
              SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Image(
                    image: AssetImage(TImages.productImage1),
                  ),
                ),
              ),

              Positioned(
                right: 0,
                bottom: 30,
                left: TSizes.defaultSpace,
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                    itemCount: 8,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (_, index) => TRoundedImage(
                      width: 80,
                      backgroundColor:
                      isDart ? TColors.dark : TColors.white,
                      border: Border.all(color: TColors.primary),
                      imageUrl: TImages.productImage3,
                    ),
                    separatorBuilder: (_, __) => const SizedBox(
                      width: TSizes.spaceBtwItems,
                    ),
                  ),
                ),
              ),

              TAppBar(
                showBackArrow: true,
                actions: [
                  TCircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}