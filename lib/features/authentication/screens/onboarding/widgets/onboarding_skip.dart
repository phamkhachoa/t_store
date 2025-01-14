import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/device/device_utility.dart';

import '../../login/bloc/login_bloc.dart';
import '../../login/bloc/login_event.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
    required this.pageController
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
          // onPressed: () => OnboardingController.instance.skipPage(),
          onPressed: () {
            BlocProvider.of<LoginBloc>(context)
                .add(NextPageOnboarding(pageController));
          },
          child: const Text('Skip')),
    );
  }
}
