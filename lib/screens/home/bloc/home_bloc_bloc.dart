import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:poc_bloc_state/data/cart_items.dart';
import 'package:poc_bloc_state/data/tech_data.dart';
import 'package:poc_bloc_state/data/wishlist_items.dart';
import 'package:poc_bloc_state/screens/home/models/home_product_data_model.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeProductsWishListButtonClickedEvent>(
        homeProductsWishListButtonClickedEvent);

    on<HomeProductsCartButtonClickedEvent>(homeProductsCartButtonClickedEvent);

    on<HomeWishListButtonNavigateEvent>(homeWishListButtonNavigateEvent);

    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeBlocState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(
      HomeLoadingDoneState(
        products: TechData.techProducts
            .map((e) => ProductDataModel(
                  id: e['id'],
                  name: e['name'],
                  description: e['description'],
                  price: e['price'],
                  imageURL: e['imageURL'],
                ))
            .toList(),
      ),
    );
  }

  FutureOr<void> homeProductsWishListButtonClickedEvent(
      HomeProductsWishListButtonClickedEvent event,
      Emitter<HomeBlocState> emit) {
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductsCartButtonClickedEvent(
      HomeProductsCartButtonClickedEvent event, Emitter<HomeBlocState> emit) {
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeWishListButtonNavigateEvent(
      HomeWishListButtonNavigateEvent event, Emitter<HomeBlocState> emit) {
    emit(HomeNavigateToWishlistScreenActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeBlocState> emit) {
    emit(HomeNavigateToCarStcreenActionState());
  }
}
