import 'package:equatable/equatable.dart';
import 'package:prueba_final_flutter/data/data.dart';
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
    on<UpdateCartQuantityMinusEvent>(_updateCartQuantityMinusEvent);
    on<UpdateCartQuantityPlusEvent>(_updateCartQuantityPlusEvent);
    on<RemoveCartItemEvent>(_removeCartItemEvent);
    on<AddToFavoritesProductsEvent>(_addToFavoritesProductsEvent);
    on<AddBookEvent>(_addBookEvent);
    on<UpdateNavIndexEvent>(_updateNavIndexEvent);
    on<DeleteBookLocallyEvent>(
        _deleteBookLocallyEvent); // Nuevo evento registrado
  }

  void _onLoadProducts(
      LoadProductsEvent event, Emitter<EcommerceState> emit) async {
    emit(state.copyWith(homeScreenState: HomeScreenState.loading));

    try {
      final serverProducts = await _firebaseService.getBooks();
      LocalDataService.initializeFromServer(serverProducts);
      final products = LocalDataService.getBooks();
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

  void _updateCartQuantityMinusEvent(
      UpdateCartQuantityMinusEvent event, Emitter<EcommerceState> emit) {
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

  void _updateCartQuantityPlusEvent(
      UpdateCartQuantityPlusEvent event, Emitter<EcommerceState> emit) {
    final List<ProductModel> updateCart = state.cart.map((product) {
      if (product.id == event.product.id) {
        return product.copyWith(quantity: product.quantity + 1);
      }
      return product;
    }).toList();

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
        final updatedProduct =
            product.copyWith(isFavorite: !product.isFavorite);
        LocalDataService.updateBook(updatedProduct);
        return updatedProduct;
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
      LocalDataService.addBook(newBook);
      final products = LocalDataService.getBooks();
      emit(state.copyWith(products: products));
    } catch (e) {
      //(print('Error adding book: $e');
    }
  }

  void _updateNavIndexEvent(
      UpdateNavIndexEvent event, Emitter<EcommerceState> emit) {
    emit(state.copyWith(currentNavIndex: event.index));
  }

// En EcommerceBloc, actualiza el método _deleteBookLocallyEvent:
void _deleteBookLocallyEvent(
    DeleteBookLocallyEvent event, Emitter<EcommerceState> emit) {
  // Eliminar de LocalDataService
  LocalDataService.deleteBook(event.product);
  
  // Actualizar la lista de productos en el estado
  final List<ProductModel> updatedProducts = state.products
      .where((product) => product.id != event.product.id)
      .toList();
  
  // También debemos remover el libro de favoritos si está ahí
  final List<ProductModel> updatedFavorites = state.favorites
      .where((product) => product.id != event.product.id)
      .toList();
  
  emit(state.copyWith(
    products: updatedProducts,
    favorites: updatedFavorites,
  ));
}
}
