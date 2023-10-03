import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:poc_bloc_state/data/cart_items.dart';
import 'package:poc_bloc_state/screens/home/models/home_product_data_model.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBlocBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBlocBloc() : super(CartBlocInitial()) {
    on<CartInitalEvent>(cartInitalEvent);
    on<CartRemoveEvent>(cartRemoveEvent);
  }

  FutureOr<void> cartInitalEvent(
      CartInitalEvent event, Emitter<CartBlocState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveEvent(
      CartRemoveEvent event, Emitter<CartBlocState> emit) {
    cartItems.remove(event.productDataModel);

    emit(CartSuccessState(cartItems: cartItems));
  }
}
