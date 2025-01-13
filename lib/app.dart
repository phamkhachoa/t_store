import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:t_store/common/global.dart';
import 'package:t_store/common/routes.dart';
import 'package:t_store/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:t_store/features/authentication/screens/login/bloc/login_bloc.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key, required this.initRoute});

  final String initRoute;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        )
      ],
      child: MaterialApp(
        title: TTexts.appName,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        navigatorKey: Global.navigatorKey,
        initialRoute: initRoute,
        routes: Routes.routes,
        // initialBinding: GeneralBindings(),
        home: const OnBoardingScreen(),
      ),
    );

    // return MaterialApp(
    //   title: TTexts.appName,
    //   themeMode: ThemeMode.system,
    //   theme: TAppTheme.lightTheme,
    //   darkTheme: TAppTheme.darkTheme,
    //   debugShowCheckedModeBanner: false,
    //   navigatorKey: Global.navigatorKey,
    //   initialRoute: initRoute,
    //   routes: Routes.routes,
    //   // initialBinding: GeneralBindings(),
    //   home: const OnBoardingScreen(),
    // );
  }
}
