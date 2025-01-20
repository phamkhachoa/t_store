import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/shop/screens/home/bloc/home_event.dart';
import 'package:t_store/features/shop/screens/home/bloc/home_state.dart';
import 'package:t_store/features/shop/screens/navigation/bloc/navigation_event.dart';
import 'package:t_store/features/shop/screens/navigation/bloc/navigation_state.dart';

import '../../../../../utils/constants/image_strings.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState()) {
    on<PageSelectedEvent>(_pageSelected);
  }

  void _pageSelected(PageSelectedEvent event, Emitter<NavigationState> emit) {
    int pageSelected = event.selectedPage;
    emit(NavigationState(currentPage: pageSelected));
  }
}
