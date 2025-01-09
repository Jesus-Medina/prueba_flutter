import 'package:equatable/equatable.dart';
import 'package:prueba_final_flutter/data/data.dart';
import 'package:prueba_final_flutter/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ecommerce_event.dart';
part 'ecommerce_state.dart';

class EcommerceBloc extends Bloc<EcommerceEvent, EcommerceState> {
  EcommerceBloc() : super(EcommerceState.initial()) {
    on<LoadProductsEvent>(_onLoadProducts);
    on<AddToCartProductsEvent>(_addToCartProductsEvent);
    on<UpdateCartQuantityEvent>(_updateCartQuantityEvent);
    on<RemoveCartItemEvent>(_removeCartItemEvent);
    on<AddToFavoritesProductsEvent>(_addToFavoritesProductsEvent);
  }

  void _onLoadProducts(
      LoadProductsEvent event, Emitter<EcommerceState> emit) async {
    emit(state.copyWith(homeScreenState: HomeScreenState.loading));

    await Future.delayed(const Duration(seconds: 2));

    final products = productsJson.map((json) {
      return ProductModel(
        id: json["id"].toString(),
        title: json["title"],
        author: json["author"],
        price: double.parse(json["price"].toString()),
        image: json["image"],
        description: json["description"],
        rating: double.parse(json["rating"].toString()),
        pages: int.parse(json["pages"].toString()),
        language: json["language"],
      );
    }).toList();

    emit(state.copyWith(
        homeScreenState: HomeScreenState.success, products: products));
  }

  void _addToCartProductsEvent(
      AddToCartProductsEvent event, Emitter<EcommerceState> emit) {
    final List<ProductModel> newCart = [];

    newCart.add(event.product);

    emit(state.copyWith(cart: newCart));
  }

  void _updateCartQuantityEvent(
      UpdateCartQuantityEvent event, Emitter<EcommerceState> emit) {}
  void _removeCartItemEvent(
      RemoveCartItemEvent event, Emitter<EcommerceState> emit) {}
  void _addToFavoritesProductsEvent(
      AddToFavoritesProductsEvent event, Emitter<EcommerceState> emit) {}
}

// LoadProductsEvent
// AddToCartProductsEvent
// UpdateCartQuantityEvent
// RemoveCartItemEvent
// AddToFavoritesProductsEvent
