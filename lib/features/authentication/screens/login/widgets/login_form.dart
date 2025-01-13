import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/global.dart';
import 'package:t_store/common/routes.dart';
import 'package:t_store/features/authentication/screens/login/bloc/login_event.dart';
import 'package:t_store/features/authentication/screens/signup/signup.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

import '../../../../../repository/auth_repository.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_state.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print('+++++++++++++++++++++ Build TLoginForm +++++++++++++++++++++');
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            _UsernameInput(),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            _PasswordInput(),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            /// Rememer me and forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(TTexts.rememberMe),
                  ],
                ),
                TextButton(
                    onPressed: () {}, child: const Text(TTexts.forgetPassword))
              ],
            ),

            const SizedBox(height: TSizes.spaceBtwSections),
            _SignInButton(),
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {
                    Get.to(() => const SignupScreen());
                  },
                  child: Text(TTexts.createAccount)),
            ),
            _TextArea(),
          ],
        ),
      ),
    );
    ;
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('+++++++++++++++++++++ Build _UsernameInput +++++++++++++++++++++');
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: (username) =>
              context.read<LoginBloc>().add(LoginUsernameChanged(username)),
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.direct_right),
            labelText: TTexts.emailOrUsername,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('+++++++++++++++++++++ Build _PasswordInput +++++++++++++++++++++');
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: (password) =>
              context.read<LoginBloc>().add(LoginPasswordChanged(password)),
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.password_check),
            labelText: TTexts.password,
          ),
        );
      },
    );
  }
}

class _SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('+++++++++++++++++++++ Build _SignInButton +++++++++++++++++++++');
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {
                // FocusScope.of(context).unfocus();
                if (state.isFillFull == true) {
                  context.read<LoginBloc>().add(LoginSubmitted());
                } else {}
              },
              child: Text(TTexts.signIn)),
        );
      },
    );
  }
}

class _TextArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('+++++++++++++++++++++ Build _TextArea +++++++++++++++++++++');
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Text(state.username ?? 'nothing');
      },
    );
  }
}
