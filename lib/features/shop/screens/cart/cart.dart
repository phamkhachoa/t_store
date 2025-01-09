import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            separatorBuilder: (_, __) =>
                const SizedBox(height: TSizes.spaceBtwSections),
            itemCount: 4,
            itemBuilder: (_, index) => Column(
              children: [
                Row(
                  children: [
                    /// Image
                    TRoundedImage(
                      imageUrl: TImages.productImage3,
                      width: 60,
                      // height: 60,
                      padding: EdgeInsets.all(TSizes.sm),
                      backgroundColor: THelperFunctions.isDarkMode(context)
                          ? TColors.darkerGrey
                          : TColors.light,
                    ),

                    const SizedBox(width: TSizes.spaceBtwItems),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
