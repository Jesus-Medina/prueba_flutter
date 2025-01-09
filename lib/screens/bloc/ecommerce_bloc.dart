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
    // Verifica si el producto ya existe en el carrito
    bool productExists =
        state.cart.any((product) => product.id == event.product.id);

    final List<ProductModel> updateCart;

    if (productExists) {
      // Si existe, solo actualiza la cantidad
      updateCart = state.cart.map((product) {
        if (product.id == event.product.id) {
          return product.copyWith(quantity: product.quantity + 1);
        }
        return product;
      }).toList();
    } else {
      // Si no existe, agrega el producto nuevo con cantidad 1
      updateCart = [...state.cart, event.product.copyWith(quantity: 1)];
    }

    emit(state.copyWith(cart: updateCart));

    print("Cart: ${state.cart}");
  }

  void _updateCartQuantityEvent(
      UpdateCartQuantityEvent event, Emitter<EcommerceState> emit) {
    final List<ProductModel> updateCart = state.cart.map((product) {
      if (product.id == event.product.id) {
        return product.copyWith(quantity: product.quantity - 1);
      }
      return product;
    }).toList();

    if (event.product.quantity == 1) {
      updateCart.removeWhere((product) => product.id == event.product.id);
    }

    emit(state.copyWith(cart: updateCart));
  }

  void _removeCartItemEvent(
      RemoveCartItemEvent event, Emitter<EcommerceState> emit) {
    // Creamos una nueva lista excluyendo el producto que queremos eliminar
    final List<ProductModel> updateCart =
        state.cart.where((product) => product.id != event.product.id).toList();

    // Emitimos el nuevo estado con el carrito actualizado
    emit(state.copyWith(cart: updateCart));
  }

  void _addToFavoritesProductsEvent(
      AddToFavoritesProductsEvent event, Emitter<EcommerceState> emit) {}
}

// LoadProductsEvent
// AddToCartProductsEvent
// UpdateCartQuantityEvent
// RemoveCartItemEvent
// AddToFavoritesProductsEvent
