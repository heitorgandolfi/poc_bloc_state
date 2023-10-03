import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:poc_bloc_state/data/wishlist_items.dart';
import 'package:poc_bloc_state/screens/home/models/home_product_data_model.dart';

part 'wishlist_bloc_event.dart';
part 'wishlist_bloc_state.dart';

class WishlistBlocBloc extends Bloc<WishlistBlocEvent, WishlistBlocState> {
  WishlistBlocBloc() : super(WishlistBlocInitial()) {
    on<WishlistBlocEvent>(wishlistBlocEvent);
    on<WishlistRemoveEvent>(wishlistRemoveEvent);
  }

  FutureOr<void> wishlistBlocEvent(
      WishlistBlocEvent event, Emitter<WishlistBlocState> emit) {
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishlistRemoveEvent(
      WishlistRemoveEvent event, Emitter<WishlistBlocState> emit) {
    wishlistItems.remove(event.productDataModel);

    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }
}
