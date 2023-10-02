part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocEvent {}

class HomeInitialEvent extends HomeBlocEvent {}

class HomeProductsWishListButtonClickedEvent extends HomeBlocEvent {
  final ProductDataModel clickedProduct;

  HomeProductsWishListButtonClickedEvent({required this.clickedProduct});
}

class HomeProductsCartButtonClickedEvent extends HomeBlocEvent {
  final ProductDataModel clickedProduct;

  HomeProductsCartButtonClickedEvent({required this.clickedProduct});
}

class HomeWishListButtonNavigateEvent extends HomeBlocEvent {}

class HomeCartButtonNavigateEvent extends HomeBlocEvent {}
