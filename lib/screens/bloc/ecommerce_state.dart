part of 'ecommerce_bloc.dart';

enum HomeScreenState {
  none,
  loading,
  success,
  failure,
}

class EcommerceState extends Equatable {
  final List<ProductModel> products;
  final List<ProductModel> cart;
  final List<ProductModel> favorites;
  final HomeScreenState homeScreenState;
  final int currentNavIndex;

  const EcommerceState({
    required this.products,
    required this.cart,
    required this.favorites,
    required this.homeScreenState,
    required this.currentNavIndex,
  });

  factory EcommerceState.initial() {
    return const EcommerceState(
      products: [],
      cart: [],
      favorites: [],
      homeScreenState: HomeScreenState.none,
      currentNavIndex: 0,
    );
  }

  EcommerceState copyWith({
    List<ProductModel>? products,
    List<ProductModel>? cart,
    List<ProductModel>? favorites,
    HomeScreenState? homeScreenState,
    int? currentNavIndex,
  }) {
    return EcommerceState(
      products: products ?? this.products,
      cart: cart ?? this.cart,
      favorites: favorites ?? this.favorites,
      homeScreenState: homeScreenState ?? this.homeScreenState,
      currentNavIndex: currentNavIndex ?? this.currentNavIndex,
    );
  }

  @override
  List<Object> get props => [products, cart, favorites, homeScreenState, currentNavIndex];
}