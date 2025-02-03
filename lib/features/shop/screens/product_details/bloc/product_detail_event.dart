import 'package:flutter/cupertino.dart';

abstract class ProductDetailEvent {
  const ProductDetailEvent();
}

final class LoadProductDetailEvent extends ProductDetailEvent {
  final String productId;
  const LoadProductDetailEvent(this.productId);
}