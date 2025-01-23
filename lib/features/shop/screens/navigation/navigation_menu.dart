import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/screens/home/home.dart';
import 'package:t_store/features/shop/screens/home/popup_bloc/popup_bloc.dart';
import 'package:t_store/features/shop/screens/navigation/bloc/navigation_bloc.dart';
import 'package:t_store/features/shop/screens/navigation/bloc/navigation_event.dart';
import 'package:t_store/features/shop/screens/navigation/bloc/navigation_state.dart';
import 'package:t_store/features/shop/screens/store/store.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../personalization/screens/settings/settings.dart';
import '../home/bloc/home_bloc.dart';
import '../wishlist/wishlist.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  final screens = [
    HomeScreen(),
    StoreScreen(),
    FavouriteScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc()),
        BlocProvider(create: (_) => NavigationBloc()),
        BlocProvider(create: (_) => PopupBloc()),
      ],
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: NavigationBar(
              height: 80,
              elevation: 0,
              selectedIndex: state.currentPage,
              onDestinationSelected: (index) {
                context.read<NavigationBloc>().add(PageSelectedEvent(index));
              },
              destinations: [
                NavigationDestination(
                    icon: SizedBox(
                      width: 25,
                      child: Image.asset(
                        'assets/icons/home/home.png',
                        color: Colors.blue,
                      ),
                    ),
                    label: 'Home'),
                const NavigationDestination(
                    icon: Icon(Iconsax.shop), label: 'Store'),
                const NavigationDestination(
                    icon: Icon(Iconsax.heart), label: 'wishlist'),
                const NavigationDestination(
                    icon: Icon(Iconsax.user), label: 'Profile')
              ],
            ),
            body: screens[state.currentPage],
          );
        },
      ),
    );
  }
}
