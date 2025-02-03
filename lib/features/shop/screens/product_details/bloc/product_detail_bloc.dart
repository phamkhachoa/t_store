import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/shop/models/product_info.dart';
import 'package:t_store/features/shop/screens/home/bloc/home_event.dart';
import 'package:t_store/features/shop/screens/home/bloc/home_state.dart';
import 'package:t_store/features/shop/screens/navigation/bloc/navigation_event.dart';
import 'package:t_store/features/shop/screens/navigation/bloc/navigation_state.dart';
import 'package:t_store/features/shop/screens/product_details/bloc/product_detail_event.dart';
import 'package:t_store/features/shop/screens/product_details/bloc/product_detail_state.dart';

import '../../../../../utils/constants/image_strings.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(ProductDetailState(productInfo: ProductInfo())) {
    on<LoadProductDetailEvent>(_loadProductDetail);
  }

  void _loadProductDetail(
      LoadProductDetailEvent event, Emitter<ProductDetailState> emit) async {
    var res = await Future.delayed(Duration(seconds: 5), () {
      print('Loaded Product Detail');
    });

    var productInfo = ProductInfo();
    productInfo.largeImageUrl = TImages.productImage1;
    emit(state.copyWith(
      productInfo: productInfo,
      isLoadingProduct: false,
    ));
  }
}
