import 'package:t_store/features/shop/models/product_info.dart';

class ProductDetailState {
  ProductDetailState({required this.productInfo, this.isLoadingProduct = true});

  ProductInfo productInfo;
  final bool isLoadingProduct;

  ProductDetailState copyWith(
      {ProductInfo? productInfo, bool? isLoadingProduct}) {
    var state = ProductDetailState(
      productInfo: productInfo ?? this.productInfo,
      isLoadingProduct: isLoadingProduct ?? this.isLoadingProduct,
    );
    return state;
  }

  @override
  List<Object?> get props => [productInfo];
}
