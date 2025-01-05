import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

import 'curverd_edges_widget.dart';
import 'custom_shapes/containers/circular_container.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidget(
      child: SizedBox(
        height: 400,
        child: Container(
          color: TColors.primary,

          /// -- [size isFinite': is not true] Error -> Read READHE.md file at [DESIGN ERRORS] # 1
          child: Stack(
            children: [
              /// -- Background Custom Shapes
              Positioned(
                  top: -150,
                  right: -250,
                  child: TCircularContainer(
                      backgroundColor: TColors.textWhite.withOpacity(0.1))),
              Positioned(
                  top: 100,
                  right: -300,
                  child: TCircularContainer(
                      backgroundColor: TColors.textWhite.withOpacity(0.1))),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
