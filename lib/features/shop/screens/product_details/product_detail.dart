import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';
import 'package:t_store/features/shop/models/product_info.dart';
import 'package:t_store/features/shop/screens/home/widgets/section_heading.dart';
import 'package:t_store/features/shop/screens/product_details/bloc/product_detail_bloc.dart';
import 'package:t_store/features/shop/screens/product_details/bloc/product_detail_event.dart';
import 'package:t_store/features/shop/screens/product_details/bloc/product_detail_state.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:t_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/constant.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // get id of product
    var receiveData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    String? id;
    String? type;
    if (receiveData != null) {
      id = receiveData[ArgumentKey.id];
      // _loadProductDetail(context, id!);
    }

    final isDart = THelperFunctions.isDarkMode(context);
    return BlocProvider(
      create: (context) => ProductDetailBloc()..add(LoadProductDetailEvent(id!)),
      child: Scaffold(
        bottomNavigationBar: TBottomAddToCart(),
        body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          builder: (context, state) {
            var productInfo = state.productInfo;

            return SingleChildScrollView(
              child: Column(
                children: [
                  /// 1 - Product Image Slider
                  TProductImageSlider(
                          isDart: isDart,
                          largeImageUrl: productInfo.largeImageUrl, isLoadProductInfo: state.isLoadingProduct,),

                  /// 2 - Product Details
                  Padding(
                    padding: EdgeInsets.only(
                        right: TSizes.defaultSpace,
                        left: TSizes.defaultSpace,
                        bottom: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        TRatingAndShare(),

                        /// Price, Title, Stoc, and Brand
                        TProductMetaData(),

                        /// -- Attributes
                        TProductAttributes(),
                        const SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),

                        /// Checkout Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {}, child: Text('Checkout')),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),

                        /// Description
                        const TSectionHeading(
                          title: 'Description',
                          showActionButton: false,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),

                        ReadMoreText(
                          'Flutter(https://flutter.dev/) has its own UI components, along with an engine to render them on both the <@123> and <@456> platforms <@999> http://google.com #read_more. Most of those UI components, right out of the box, conform to the guidelines of #Material Design.',
                          trimLines: 2,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: ' Show more',
                          trimExpandedText: ' Less',
                          moreStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w800),
                          lessStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w800),
                        ),

                        const Divider(),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TSectionHeading(
                              title: 'Reviews(199)',
                              onPressed: () =>
                                  Get.to(() => const ProductReviewsScreen()),
                              showActionButton: false,
                            ),
                            IconButton(
                                onPressed: () =>
                                    Get.to(() => const ProductReviewsScreen()),
                                icon: const Icon(
                                  Iconsax.arrow_right_3,
                                  size: 18,
                                ))
                          ],
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _loadProductDetail(BuildContext context, String productId) {
    context.read<ProductDetailBloc>().add(LoadProductDetailEvent(productId));
  }
}
