import 'package:equatable/equatable.dart';
import 'package:prueba_final_flutter/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_final_flutter/services/firebase_services.dart';

part 'ecommerce_event.dart';
part 'ecommerce_state.dart';

class EcommerceBloc extends Bloc<EcommerceEvent, EcommerceState> {
  final FirebaseService _firebaseService = FirebaseService();

  EcommerceBloc() : super(EcommerceState.initial()) {
    on<LoadProductsEvent>(_onLoadProducts);
    on<AddToCartProductsEvent>(_addToCartProductsEvent);
    on<UpdateCartQuantityEvent>(_updateCartQuantityEvent);
    on<RemoveCartItemEvent>(_removeCartItemEvent);
    on<AddToFavoritesProductsEvent>(_addToFavoritesProductsEvent);
    on<AddBookEvent>(_addBookEvent);
    on<UpdateNavIndexEvent>(_updateNavIndexEvent);
  }

  void _onLoadProducts(
      LoadProductsEvent event, Emitter<EcommerceState> emit) async {
    emit(state.copyWith(homeScreenState: HomeScreenState.loading));

    try {
      final products = await _firebaseService.getBooks();
      emit(state.copyWith(
          homeScreenState: HomeScreenState.success, products: products));
    } catch (e) {
      emit(state.copyWith(homeScreenState: HomeScreenState.failure));
    }
  }

  void _addToCartProductsEvent(
      AddToCartProductsEvent event, Emitter<EcommerceState> emit) {
    bool productExists =
        state.cart.any((product) => product.id == event.product.id);

    final List<ProductModel> updateCart;

    if (productExists) {
      updateCart = state.cart.map((product) {
        if (product.id == event.product.id) {
          return product.copyWith(
            quantity: product.quantity + event.product.quantity,
          );
        }
        return product;
      }).toList();
    } else {
      updateCart = [
        ...state.cart,
        event.product,
      ];
    }

    emit(state.copyWith(cart: updateCart));
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
    final List<ProductModel> updateCart =
        state.cart.where((product) => product.id != event.product.id).toList();
    emit(state.copyWith(cart: updateCart));
  }

  void _addToFavoritesProductsEvent(
      AddToFavoritesProductsEvent event, Emitter<EcommerceState> emit) {
    final List<ProductModel> updateProducts = state.products.map((product) {
      if (product.id == event.product.id) {
        return product.copyWith(isFavorite: !product.isFavorite);
      }
      return product;
    }).toList();

    List<ProductModel> updateFavorites = List.from(state.favorites);

    bool existsInFavorites =
        updateFavorites.any((product) => product.id == event.product.id);

    if (existsInFavorites) {
      updateFavorites.removeWhere((product) => product.id == event.product.id);
    } else {
      updateFavorites.add(event.product.copyWith(isFavorite: true));
    }

    emit(state.copyWith(products: updateProducts, favorites: updateFavorites));
  }

  void _addBookEvent(AddBookEvent event, Emitter<EcommerceState> emit) async {
    final newBook = ProductModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: event.title,
      author: event.author,
      price: 12.99,
      image: "https://m.media-amazon.com/images/I/71wvzWzpQwL._SL1500_.jpg",
      description:
          "«El historiador tiene una habilidad endemoniada para exponer argumentos sofisticados sobre cuestiones complejas sin dolor para el lector [...]. Pocos pensadores pueden escribir 600 páginas plagadas de ideas innovadoras y estimulantes que el lector puede absorber como quien da un paseo por el campo. Aunque sea un campo de minas».",
      rating: 4.5,
      pages: 689,
      language: "ES",
    );

    try {
      await _firebaseService.addBook(newBook);
      final products = await _firebaseService.getBooks();
      emit(state.copyWith(products: products));
    } catch (e) {
      print('Error adding book: $e');
    }
  }

  void _updateNavIndexEvent(
      UpdateNavIndexEvent event, Emitter<EcommerceState> emit) {
    emit(state.copyWith(currentNavIndex: event.index));
  }
}
