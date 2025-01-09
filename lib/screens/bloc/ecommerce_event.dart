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

class AddToFavoritesProductsEvent extends EcommerceEvent {
  final ProductModel product;

  const AddToFavoritesProductsEvent({required this.product});
}

class AddBookEvent extends EcommerceEvent {
  final String title;
  final String author;

  const AddBookEvent({
    required this.title,
    required this.author,
  });
}

class UpdateNavIndexEvent extends EcommerceEvent {
  final int index;

  const UpdateNavIndexEvent({required this.index});

  @override
  List<Object> get props => [index];
}