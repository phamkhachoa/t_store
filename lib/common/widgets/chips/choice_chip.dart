import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: true ? TColors.white : null),
        avatar: isColor
            ? TCircularContainer(
                backgroundColor: THelperFunctions.getColor(text)!,
                width: 50,
                height: 50,
              )
            : null,
        shape: isColor? CircleBorder() : null,
        labelPadding:  isColor ?  EdgeInsets.all(0): null,
        padding: isColor ?  EdgeInsets.all(0): null,
        selectedColor: Colors.green,
        backgroundColor: isColor ? THelperFunctions.getColor(text)! : null,
      ),
    );
  }
}
