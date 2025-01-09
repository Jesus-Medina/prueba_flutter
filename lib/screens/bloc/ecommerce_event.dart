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

class UpdateCartQuantityEvent extends EcommerceEvent {}

class RemoveCartItemEvent extends EcommerceEvent {}

class AddToFavoritesProductsEvent extends EcommerceEvent {}
