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
    on<AddBookEvent>(_addBookEvent);
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
      // Si existe, actualiza sumando la nueva cantidad
      updateCart = state.cart.map((product) {
        if (product.id == event.product.id) {
          return product.copyWith(
              quantity: product.quantity +
                  event.product.quantity // Suma la nueva cantidad
              );
        }
        return product;
      }).toList();
    } else {
      // Si no existe, agrega el producto con la cantidad seleccionada
      updateCart = [
        ...state.cart,
        event.product
      ]; // Ya no necesitas copyWith porque el producto ya viene con la cantidad
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
      AddToFavoritesProductsEvent event, Emitter<EcommerceState> emit) {
    // Actualizamos isFavorite en la lista de productos
    final List<ProductModel> updateProducts = state.products.map((product) {
      if (product.id == event.product.id) {
        return product.copyWith(isFavorite: !product.isFavorite);
      }
      return product;
    }).toList();

    // Actualizamos la lista de favoritos
    List<ProductModel> updateFavorites = List.from(state.favorites);

    // Verificamos si el producto ya existe en favoritos
    bool existsInFavorites =
        updateFavorites.any((product) => product.id == event.product.id);

    if (existsInFavorites) {
      // Si ya existe, lo removemos
      updateFavorites.removeWhere((product) => product.id == event.product.id);
    } else {
      // Si no existe, lo añadimos
      updateFavorites.add(event.product.copyWith(isFavorite: true));
    }

    // Emitimos el nuevo estado con ambas listas actualizadas
    emit(state.copyWith(
      products: updateProducts,
      favorites: updateFavorites,
    ));
  }

  void _addBookEvent(AddBookEvent event, Emitter<EcommerceState> emit) {
    // Crear un nuevo libro con datos autogenerados
    final newBook = {
      "id": state.products.length + 1,
      "title": event.title,
      "author": event.author,
      "price": 45.0, // precio por defecto
      "image": "assets/images/book.jpg", // imagen por defecto
      "description":
          "lorem ipsum dolor sit amet, consectetur adipiscing elit...", // descripción por defecto
      "rating": 4.5, // rating por defecto
      "pages": 20, // páginas por defecto
      "language": "ES", // idioma por defecto
    };

    // Añadir el nuevo libro a productsJson
    productsJson.add(newBook);

    // Convertir y actualizar la lista de productos
    final updatedProducts = productsJson.map((json) {
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

    // Emitir el nuevo estado con la lista actualizada
    emit(state.copyWith(products: updatedProducts));
  }

// LoadProductsEvent
// AddToCartProductsEvent
// UpdateCartQuantityEvent
// RemoveCartItemEvent
// AddToFavoritesProductsEvent
}
