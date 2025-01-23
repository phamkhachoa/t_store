import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:t_store/features/shop/screens/home/popup_bloc/popup_event.dart';
import 'package:t_store/features/shop/screens/home/popup_bloc/popup_state.dart';

import '../../../../../utils/constants/image_strings.dart';

class PopupBloc extends Bloc<PopupEvent, PopupState> {
  PopupBloc() : super(PopupState()) {
    on<LoadPopupEvent>(_popupImagesFetch);
  }

  void _popupImagesFetch(LoadPopupEvent event, Emitter<PopupState> emit) async {
    var res = await Future.delayed(Duration(seconds: 1), () {
      print('Loaded slider list1');
    });

    List<String> imagesPopups = [
      "https://minhduongstore.com/wp-content/uploads/2024/09/iphone-16-plus-xanh-luu-ly-1.webp",
      "https://www.sammyfans.com/wp-content/uploads/2024/11/samsung-galaxy-s25-img2.jpg",
      "https://hoanghamobile.com/tin-tuc/wp-content/uploads/2024/04/anh-tet-2025-8.jpg",
    ];
    emit(state.copyWith(imagesPopups: imagesPopups));
  }
}
