import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';
import '../../../../utils/constants/colors.dart';

class TRatingBarIndicator extends StatelessWidget {
  const TRatingBarIndicator({
    super.key, required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        rating: rating,
        itemSize: 20,
        unratedColor: TColors.grey,
        itemBuilder: (_, __) => Icon(
          Iconsax.star,
          color: TColors.primary,
        ));
  }
}

class TOverallProductRating extends StatelessWidget {
  const TOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '4.8',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        // const SizedBox(width: TSizes.spaceBtwItems,),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              TRatingProgressIndicator(
                text: '5',
                value: 1.0,
              ),
              TRatingProgressIndicator(
                text: '4',
                value: 0.5,
              ),
              TRatingProgressIndicator(
                text: '3',
                value: 0.4,
              ),
              TRatingProgressIndicator(
                text: '2',
                value: 0.2,
              ),
              TRatingProgressIndicator(
                text: '1',
                value: 0.1,
              ),
            ],
          ),
        )
      ],
    );
  }
}