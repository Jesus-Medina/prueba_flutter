part of 'ecommerce_bloc.dart';

sealed class EcommerceEvent extends Equatable {
  const EcommerceEvent();

  @override
  List<Object> get props => [];
}

class LoadProductsEvent extends EcommerceEvent {}

class AddToCartProductsEvent extends EcommerceEvent {
  final ProductModel product;

  const AddToCartProductsEvent({required this.product});
}

class UpdateCartQuantityEvent extends EcommerceEvent {
  final ProductModel product;

  const UpdateCartQuantityEvent({required this.product});
}

class RemoveCartItemEvent extends EcommerceEvent {
  final ProductModel product;

  const RemoveCartItemEvent({required this.product});
}

class AddToFavoritesProductsEvent extends EcommerceEvent {}
