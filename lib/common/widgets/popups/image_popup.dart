import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../images/t_rounded_image.dart';

class ImagePopup extends StatelessWidget {
  const ImagePopup({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Dialog(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  borderRadius: BorderRadius.circular(24),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24)
                    ),
                    child: Icon(Icons.close, color: Colors.black, size: 24,),
                  ),
                ),
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TRoundedImage(
                imageUrl: imageUrl,
                isNetworkImage: true,
                width: THelperFunctions.screenWidth(context) * 0.8,
                height: THelperFunctions.screenHeight(context) * 0.7,
                borderRadius: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
