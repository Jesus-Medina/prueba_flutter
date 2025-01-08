part of 'ecommerce_bloc.dart';

sealed class EcommerceEvent extends Equatable {
  const EcommerceEvent();

  @override
  List<Object> get props => [];
}

class LoadProductsEvent extends EcommerceEvent {}

class AddToCartProductsEvent extends EcommerceEvent {}

class UpdateCartQuantityEvent extends EcommerceEvent {}

class RemoveCartItemEvent extends EcommerceEvent {}

class AddToFavoritesProductsEvent extends EcommerceEvent {}
